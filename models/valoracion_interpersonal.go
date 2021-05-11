package models

import (
	"errors"
	"fmt"
	"reflect"
	"strings"

	"github.com/astaxie/beego/orm"
	"github.com/udistrital/utils_oas/time_bogota"
)

type ValoracionInterpersonal struct {
	Id                int           `orm:"column(id);pk;auto"`
	HojaHistoriaId    *HojaHistoria `orm:"column(hoja_historia_id);rel(fk)"`
	Autoridad         string        `orm:"column(autoridad)"`
	Pares             string        `orm:"column(pares)"`
	Pareja            string        `orm:"column(pareja)"`
	Relaciones        bool          `orm:"column(relaciones)"`
	Satisfaccion      string        `orm:"column(satisfaccion)"`
	Proteccion        string        `orm:"column(proteccion)"`
	Orientacion       string        `orm:"column(orientacion)"`
	Judiciales        string        `orm:"column(judiciales)"`
	Economicos        string        `orm:"column(economicos)"`
	Drogas            string        `orm:"column(drogas)"`
	FechaCreacion     string  			`orm:"column(fecha_creacion);null"`
	FechaModificacion string  			`orm:"column(fecha_modificacion);null"`
}

func (t *ValoracionInterpersonal) TableName() string {
	return "valoracion_interpersonal"
}

func init() {
	orm.RegisterModel(new(ValoracionInterpersonal))
}

// AddValoracionInterpersonal insert a new ValoracionInterpersonal into database and returns
// last inserted Id on success.
func AddValoracionInterpersonal(m *ValoracionInterpersonal) (id int64, err error) {
	m.FechaCreacion = time_bogota.TiempoBogotaFormato()
	m.FechaModificacion = time_bogota.TiempoBogotaFormato()
	o := orm.NewOrm()
	id, err = o.Insert(m)
	return
}

// GetValoracionInterpersonalById retrieves ValoracionInterpersonal by Id. Returns error if
// Id doesn't exist
func GetValoracionInterpersonalById(id int) (v *ValoracionInterpersonal, err error) {
	o := orm.NewOrm()
	v = &ValoracionInterpersonal{Id: id}
	if err = o.Read(v); err == nil {
		return v, nil
	}
	return nil, err
}

// GetAllValoracionInterpersonal retrieves all ValoracionInterpersonal matches certain condition. Returns empty list if
// no records exist
func GetAllValoracionInterpersonal(query map[string]string, fields []string, sortby []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(ValoracionInterpersonal))
	// query k=v
	for k, v := range query {
		// rewrite dot-notation to Object__Attribute
		k = strings.Replace(k, ".", "__", -1)
		if strings.Contains(k, "isnull") {
			qs = qs.Filter(k, (v == "true" || v == "1"))
		} else {
			qs = qs.Filter(k, v)
		}
	}
	// order by:
	var sortFields []string
	if len(sortby) != 0 {
		if len(sortby) == len(order) {
			// 1) for each sort field, there is an associated order
			for i, v := range sortby {
				orderby := ""
				if order[i] == "desc" {
					orderby = "-" + v
				} else if order[i] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
			qs = qs.OrderBy(sortFields...)
		} else if len(sortby) != len(order) && len(order) == 1 {
			// 2) there is exactly one order, all the sorted fields will be sorted by this order
			for _, v := range sortby {
				orderby := ""
				if order[0] == "desc" {
					orderby = "-" + v
				} else if order[0] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
		} else if len(sortby) != len(order) && len(order) != 1 {
			return nil, errors.New("Error: 'sortby', 'order' sizes mismatch or 'order' size is not 1")
		}
	} else {
		if len(order) != 0 {
			return nil, errors.New("Error: unused 'order' fields")
		}
	}

	var l []ValoracionInterpersonal
	qs = qs.OrderBy(sortFields...)
	if _, err = qs.Limit(limit, offset).All(&l, fields...); err == nil {
		if len(fields) == 0 {
			for _, v := range l {
				ml = append(ml, v)
			}
		} else {
			// trim unused fields
			for _, v := range l {
				m := make(map[string]interface{})
				val := reflect.ValueOf(v)
				for _, fname := range fields {
					m[fname] = val.FieldByName(fname).Interface()
				}
				ml = append(ml, m)
			}
		}
		return ml, nil
	}
	return nil, err
}

// UpdateValoracionInterpersonal updates ValoracionInterpersonal by Id and returns error if
// the record to be updated doesn't exist
func UpdateValoracionInterpersonalById(m *ValoracionInterpersonal) (err error) {
	o := orm.NewOrm()
	v := ValoracionInterpersonal{Id: m.Id}
	m.FechaModificacion = time_bogota.TiempoBogotaFormato()
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Update(m, "HojaHistoriaId", "Autoridad", "Pares", "Pareja", "Relaciones", "Satisfaccion", "Proteccion", "Orientacion", "Judiciales", "Economicos", "Drogas", "FechaModificacion"); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

// DeleteValoracionInterpersonal deletes ValoracionInterpersonal by Id and returns error if
// the record to be deleted doesn't exist
func DeleteValoracionInterpersonal(id int) (err error) {
	o := orm.NewOrm()
	v := ValoracionInterpersonal{Id: id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Delete(&ValoracionInterpersonal{Id: id}); err == nil {
			fmt.Println("Number of records deleted in database:", num)
		}
	}
	return
}
