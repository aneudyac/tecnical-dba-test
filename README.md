# tecnical-dba-test


**Reglas Generales:**

* **Prefijos Obligatorios:** Usa los prefijos indicados en la tabla para identificar fácilmente los tipos de objeto.
* **CamelCase:**  Usa CamelCase para los nombres (primera letra de cada palabra en mayúscula, sin espacios ni guiones bajos).  Ejemplo: `tblClientes`
* **Nombres Descriptivos:** Emplea nombres que reflejen claramente la función o información contenida en el objeto (No importa que sea un nombre largo).
* **Nombres Concisos:** Mantén los nombres lo más cortos posible, pero sin sacrificar la claridad.

**Tabla de Convenciones:**

| Objeto              | Prefijo | Ejemplo                                                 |
|---------------------|---------|---------------------------------------------------------|
| Tablas              | tbl     | [schema].tblClientes                                    |
| Procedimientos      | sp      | [schema].spIUCliente                                    |
| Funciones           | fn      | [schema].fnCalcularISN                                  |
| Vistas              | vw      | [schema].vwEmpleadosVigentes                            |
| Claves Primarias    | PK      | PK_[schema]TblClientes_IDCliente                        |
| Claves Foráneas     | FK      | FK_[schema]TblEmpleados_[schema]TblClientes_IdCliente   |
| Índices Únicos      | U       | U_[schema]TblEmpleados_Codigo                           |
| Valores por Defecto | D       | D_[schema]TblProductos_FechaRegistro                    |
| Contraint Check     | Chk     | Chk_[schema]TblProductos_Traduccion                     |

**Convenciones de Nomenclatura para Procedimientos Almacenados:**

| Tipo de Operación | Prefijo + Acción | Ejemplo      |
|-------------------|-----------|---------------------|
| Insertar          | spI       | spICliente          |
| Actualizar        | spU       | spUCliente          |
| Insertar/Actualizar| spIU     | spIUCliente         |
| Consultar (Plural)| spBsucar  | spBuscarClientes    |
| Consultar uno     | spBuscar  | spBuscarCliente     |
| Eliminar          | spBorrar  | spBorrarCliente     |

**Notas Importantes:**

* Si bien SQL Server no distingue entre mayúsculas y minúsculas, usar mayúsculas para los prefijos, CamelCase o PascalCase(Según corresponda) mejora considerablemente la lectura. 
* Emplea nombres en plurar para las tablas.

