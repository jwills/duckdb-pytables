
#include <vector>
#include <duckdb.hpp>
#include <Python.h>

namespace pyudf {
PyObject *duckdb_to_py(duckdb::Value &value);
PyObject *duckdbs_to_pys(std::vector<duckdb::Value> &values);
PyObject *StructToDict(duckdb::Value value);
duckdb::Value ConvertPyObjectToDuckDBValue(PyObject *py_item, duckdb::LogicalType logical_type);
void ConvertPyObjectsToDuckDBValues(PyObject *py_iterator, std::vector<duckdb::LogicalType> logical_types,
                                    std::vector<duckdb::Value> &result);
PyObject *pyObjectToIterable(PyObject *py_object);

} // namespace pyudf
