package models

import (
	"errors"
	"fmt"
	"reflect"
	"strings"

	"github.com/astaxie/beego/orm"
	"github.com/udistrital/utils_oas/time_bogota"
)

type SignosVitales struct {
	Id                     int           `orm:"column(id);pk;auto"`
	HojaHistoriaId         *HojaHistoria `orm:"column(hoja_historia_id);rel(fk)"`
	Temperatura            float64       `orm:"column(temperatura);null"`
	TensionSistolica       int           `orm:"column(tension_sistolica);null"`
	TensionDiastolica      int           `orm:"column(tension_diastolica);null"`
	TensionMedia           float64       `orm:"column(tension_media);null"`
	Estatura               float64       `orm:"column(estatura);null"`
	Peso                   float64       `orm:"column(peso);null"`
	Imc                    float64       `orm:"column(imc);null"`
	Saturacion             int           `orm:"column(saturacion);null"`
	FrecuenciaCardiaca     int           `orm:"column(frecuencia_cardiaca);null"`
	FrecuenciaRespiratoria int           `orm:"column(frecuencia_respiratoria);null"`
	PerimetroAbdominal     float64       `orm:"column(perimetro_abdominal);null"`
	FechaCreacion     		 string  			 `orm:"column(fecha_creacion);null"`
	FechaModificacion 		 string  			 `orm:"column(fecha_modificacion);null"`
}

func (t *SignosVitales) TableName() string {
	return "signos_vitales"
}

func init() {
	orm.RegisterModel(new(SignosVitales))
}

// AddSignosVitales insert a new SignosVitales into database and returns
// last inserted Id on success.
func AddSignosVitales(m *SignosVitales) (id int64, err error) {
	m.FechaCreacion = time_bogota.TiempoBogotaFormato()
	m.FechaModificacion = time_bogota.TiempoBogotaFormato()
	o := orm.NewOrm()
	id, err = o.Insert(m)
	return
}

// GetSignosVitalesById retrieves SignosVitales by Id. Returns error if
// Id doesn't exist
func GetSignosVitalesById(id int) (v *SignosVitales, err error) {
	o := orm.NewOrm()
	v = &SignosVitales{Id: id}
	if err = o.Read(v); err == nil {
		return v, nil
	}
	return nil, err
}

// GetAllSignosVitales retrieves all SignosVitales matches certain condition. Returns empty list if
// no records exist
func GetAllSignosVitales(query map[string]string, fields []string, sortby []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(SignosVitales))
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

	var l []SignosVitales
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

// UpdateSignosVitales updates SignosVitales by Id and returns error if
// the record to be updated doesn't exist
func UpdateSignosVitalesById(m *SignosVitales) (err error) {
	o := orm.NewOrm()
	v := SignosVitales{Id: m.Id}
	m.FechaModificacion = time_bogota.TiempoBogotaFormato()
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Update(m, "HojaHistoriaId", "Temperatura", "TensionSistolica", "TensionDiastolica", "TensionMedia", "Estatura", "Peso", "Imc", "Saturacion", "FrecuenciaCardiaca", "FrecuenciaRespiratoria", "PerimetroAbdominal", "FechaModificacion"); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

// DeleteSignosVitales deletes SignosVitales by Id and returns error if
// the record to be deleted doesn't exist
func DeleteSignosVitales(id int) (err error) {
	o := orm.NewOrm()
	v := SignosVitales{Id: id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Delete(&SignosVitales{Id: id}); err == nil {
			fmt.Println("Number of records deleted in database:", num)
		}
	}
	return
}
