package controllers

import (
	"encoding/json"
	"strconv"
	"strings"

	"github.com/planesticud/bienestar_medico_crud/models"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/logs"
)

// ValoracionInterpersonalController operations for ValoracionInterpersonal
type ValoracionInterpersonalController struct {
	beego.Controller
}

// URLMapping ...
func (c *ValoracionInterpersonalController) URLMapping() {
	c.Mapping("Post", c.Post)
	c.Mapping("GetOne", c.GetOne)
	c.Mapping("GetAll", c.GetAll)
	c.Mapping("Put", c.Put)
	c.Mapping("Delete", c.Delete)
}

// Post ...
// @Title Post
// @Description create ValoracionInterpersonal
// @Param	body		body 	models.ValoracionInterpersonal	true		"body for ValoracionInterpersonal content"
// @Success 201 {int} models.ValoracionInterpersonal
// @Failure 400 the request contains incorrect syntax
// @router / [post]
func (c *ValoracionInterpersonalController) Post() {
	var v models.ValoracionInterpersonal
	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &v); err == nil {
		if _, err := models.AddValoracionInterpersonal(&v); err == nil {
			c.Ctx.Output.SetStatus(201)
			c.Data["json"] = v
		} else {
			c.Data["json"] = err.Error()
			logs.Error(err)
			//c.Data["development"] = map[string]interface{}{"Code": "400", "Body": err.Error(), "Type": "error"}
			c.Data["system"] = err
			c.Abort("400")
		}
	} else {
		c.Data["json"] = err.Error()
		logs.Error(err)
		//c.Data["development"] = map[string]interface{}{"Code": "400", "Body": err.Error(), "Type": "error"}
		c.Data["system"] = err
		c.Abort("400")
	}
	c.ServeJSON()
}

// GetOne ...
// @Title Get One
// @Description get ValoracionInterpersonal by id
// @Param	id		path 	string	true		"The key for staticblock"
// @Success 200 {object} models.ValoracionInterpersonal
// @Failure 404 not found resource
// @router /:id [get]
func (c *ValoracionInterpersonalController) GetOne() {
	idStr := c.Ctx.Input.Param(":id")
	id, _ := strconv.Atoi(idStr)
	v, err := models.GetValoracionInterpersonalById(id)
	if err != nil {
		c.Data["json"] = err.Error()
		logs.Error(err)
		//c.Data["development"] = map[string]interface{}{"Code": "404", "Body": err.Error(), "Type": "error"}
		c.Data["system"] = err
		c.Abort("404")
	} else {
		c.Data["json"] = v
	}
	c.ServeJSON()
}

// GetAll ...
// @Title Get All
// @Description get ValoracionInterpersonal
// @Param	query	query	string	false	"Filter. e.g. col1:v1,col2:v2 ..."
// @Param	fields	query	string	false	"Fields returned. e.g. col1,col2 ..."
// @Param	sortby	query	string	false	"Sorted-by fields. e.g. col1,col2 ..."
// @Param	order	query	string	false	"Order corresponding to each sortby field, if single value, apply to all sortby fields. e.g. desc,asc ..."
// @Param	limit	query	string	false	"Limit the size of result set. Must be an integer"
// @Param	offset	query	string	false	"Start position of result set. Must be an integer"
// @Success 200 {object} models.ValoracionInterpersonal
// @Failure 404 not found resource
// @router / [get]
func (c *ValoracionInterpersonalController) GetAll() {
	var fields []string
	var sortby []string
	var order []string
	var query = make(map[string]string)
	var limit int64 = 10
	var offset int64

	// fields: col1,col2,entity.col3
	if v := c.GetString("fields"); v != "" {
		fields = strings.Split(v, ",")
	}
	// limit: 10 (default is 10)
	if v, err := c.GetInt64("limit"); err == nil {
		limit = v
	}
	// offset: 0 (default is 0)
	if v, err := c.GetInt64("offset"); err == nil {
		offset = v
	}
	// sortby: col1,col2
	if v := c.GetString("sortby"); v != "" {
		sortby = strings.Split(v, ",")
	}
	// order: desc,asc
	if v := c.GetString("order"); v != "" {
		order = strings.Split(v, ",")
	}
	// query: k:v,k:v
	if v := c.GetString("query"); v != "" {
		for _, cond := range strings.Split(v, ",") {
			kv := strings.SplitN(cond, ":", 2)
			if len(kv) != 2 {
				//c.Data["json"] = errors.New("Error: invalid query key/value pair")
				c.Data["json"] = models.Alert{Type: "error", Code: "E_400", Body: "Error: invalid query key/value pair"}
				c.ServeJSON()
				return
			}
			k, v := kv[0], kv[1]
			query[k] = v
		}
	}

	l, err := models.GetAllValoracionInterpersonal(query, fields, sortby, order, offset, limit)
	if err != nil {
		c.Data["json"] = err.Error()
		logs.Error(err)
		//c.Data["development"] = map[string]interface{}{"Code": "404", "Body": err.Error(), "Type": "error"}
		c.Data["system"] = err
		c.Abort("404")
	} else {
		if l == nil {
			l = append(l, map[string]interface{}{})
		}
		c.Data["json"] = l
	}
	c.ServeJSON()
}

// Put ...
// @Title Put
// @Description update the ValoracionInterpersonal
// @Param	id		path 	string	true		"The id you want to update"
// @Param	body		body 	models.ValoracionInterpersonal	true		"body for ValoracionInterpersonal content"
// @Success 200 {object} models.ValoracionInterpersonal
// @Failure 400 the request contains incorrect syntax
// @router /:id [put]
func (c *ValoracionInterpersonalController) Put() {
	idStr := c.Ctx.Input.Param(":id")
	id, _ := strconv.Atoi(idStr)
	v := models.ValoracionInterpersonal{Id: id}
	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &v); err == nil {
		if err := models.UpdateValoracionInterpersonalById(&v); err == nil {
			c.Data["json"] = "OK"
			c.Ctx.Output.SetStatus(200)
			c.Data["json"] = v
		} else {
			c.Data["json"] = err.Error()
			logs.Error(err)
			//c.Data["development"] = map[string]interface{}{"Code": "400", "Body": err.Error(), "Type": "error"}
			c.Data["System"] = err
			c.Abort("400")
		}
	} else {
		c.Data["json"] = err.Error()
		logs.Error(err)
		//c.Data["development"] = map[string]interface{}{"Code": "400", "Body": err.Error(), "Type": "error"}
		c.Data["System"] = err
		c.Abort("400")
	}
	c.ServeJSON()
}

// Delete ...
// @Title Delete
// @Description delete the ValoracionInterpersonal
// @Param	id		path 	string	true		"The id you want to delete"
// @Success 200 {string} delete success!
// @Failure 404 not found resource
// @router /:id [delete]
func (c *ValoracionInterpersonalController) Delete() {
	idStr := c.Ctx.Input.Param(":id")
	id, _ := strconv.Atoi(idStr)
	if err := models.DeleteValoracionInterpersonal(id); err == nil {
		c.Data["json"] = map[string]interface{}{"Id": id}
	} else {
		c.Data["json"] = err.Error()
		logs.Error(err)
		//c.Data["development"] = map[string]interface{}{"Code": "404", "Body": err.Error(), "Type": "error"}
		c.Data["System"] = err
		c.Abort("404")
	}
	c.ServeJSON()
}
