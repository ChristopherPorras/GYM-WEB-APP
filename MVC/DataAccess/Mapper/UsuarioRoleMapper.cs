﻿using DataAccess.DAO;
using DTO;
using System.Collections.Generic;

namespace DataAccess.Mapper
{
    public class UsuarioRoleMapper : EntityMapper
    {
        public override SqlOperation GetCreateStatement(BaseClass entity)
        {
            var usuarioRole = (UsuarioRole)entity;
            var operation = new SqlOperation
            {
                ProcedureName = "CreateUsuarioConRol"
            };
            operation.AddVarcharParam("CorreoElectronico", usuarioRole.CorreoElectronico);
            operation.AddVarcharParam("Nombre", usuarioRole.Nombre);
            operation.AddVarcharParam("Contrasena", usuarioRole.Contrasena);
            operation.AddDateTimeParam("FechaRegistro", usuarioRole.FechaRegistro);
            operation.AddVarcharParam("Telefono", usuarioRole.Telefono);
            operation.AddVarcharParam("TipoUsuario", usuarioRole.TipoUsuario);
            operation.AddBitParam("Estado", usuarioRole.Estado);
            operation.AddBitParam("HaPagado", usuarioRole.HaPagado);
            operation.AddBitParam("CorreoVerificado", usuarioRole.CorreoVerificado);
            operation.AddBitParam("TelefonoVerificado", usuarioRole.TelefonoVerificado);
            operation.AddIntegerParam("RolId", usuarioRole.RolId);
            return operation;
        }

        public override SqlOperation GetUpdateStatement(BaseClass entity)
        {
            var usuarioRole = (UsuarioRoleUpdate)entity;
            var operation = new SqlOperation
            {
                ProcedureName = "UpdateUsuarioRole"
            };
            operation.AddVarcharParam("OriginalCorreoElectronico", usuarioRole.OriginalCorreoElectronico);
            operation.AddVarcharParam("CorreoElectronico", usuarioRole.CorreoElectronico);
            operation.AddVarcharParam("Nombre", usuarioRole.Nombre);
            operation.AddDateTimeParam("FechaRegistro", usuarioRole.FechaRegistro);
            operation.AddVarcharParam("Telefono", usuarioRole.Telefono);
            operation.AddVarcharParam("TipoUsuario", usuarioRole.TipoUsuario);
            operation.AddBitParam("Estado", usuarioRole.Estado);
            operation.AddBitParam("HaPagado", usuarioRole.HaPagado);
            operation.AddBitParam("CorreoVerificado", usuarioRole.CorreoVerificado);
            operation.AddBitParam("TelefonoVerificado", usuarioRole.TelefonoVerificado);
            operation.AddIntegerParam("RolId", usuarioRole.RolId);
            return operation;
        }

        public SqlOperation GetRetrieveByEmailStatement(string correoElectronico)
        {
            var operation = new SqlOperation
            {
                ProcedureName = "GetUsuarioRoleByEmail"
            };
            operation.AddVarcharParam("CorreoElectronico", correoElectronico);
            return operation;
        }

        public override SqlOperation GetRetrieveByIdStatement(int id)
        {
            var operation = new SqlOperation
            {
                ProcedureName = "GetUsuarioRoleById"
            };
            operation.AddIntegerParam("Id", id);
            return operation;
        }

        public override SqlOperation GetRetrieveAllStatement()
        {
            var operation = new SqlOperation
            {
                ProcedureName = "GetAllUsuariosConRoles"
            };
            return operation;
        }

        public override SqlOperation GetDeleteStatement(BaseClass entity)
        {
            var usuarioRole = (UsuarioRole)entity;
            var operation = new SqlOperation
            {
                ProcedureName = "DeleteUsuarioRole"
            };
            operation.AddVarcharParam("CorreoElectronico", usuarioRole.CorreoElectronico);
            return operation;
        }

        public override BaseClass BuildObject(Dictionary<string, object> row)
        {
            var usuarioRole = new UsuarioRole
            {
                CorreoElectronico = row["CorreoElectronico"].ToString(),
                Nombre = row.ContainsKey("Nombre") ? row["Nombre"].ToString() : null,
                Contrasena = row.ContainsKey("Contrasena") ? row["Contrasena"].ToString() : null,
                FechaRegistro = row.ContainsKey("FechaRegistro") ? Convert.ToDateTime(row["FechaRegistro"]) : default(DateTime),
                Telefono = row.ContainsKey("Telefono") ? row["Telefono"].ToString() : null,
                TipoUsuario = row.ContainsKey("TipoUsuario") ? row["TipoUsuario"].ToString() : null,
                Estado = row.ContainsKey("Estado") ? Convert.ToBoolean(row["Estado"]) : false,
                HaPagado = row.ContainsKey("HaPagado") ? Convert.ToBoolean(row["HaPagado"]) : false,
                CorreoVerificado = row.ContainsKey("CorreoVerificado") ? Convert.ToBoolean(row["CorreoVerificado"]) : false,
                TelefonoVerificado = row.ContainsKey("TelefonoVerificado") ? Convert.ToBoolean(row["TelefonoVerificado"]) : false,
                RolId = row.ContainsKey("RolId") ? Convert.ToInt32(row["RolId"]) : 0,
                ID = row.ContainsKey("Id") ? Convert.ToInt32(row["Id"]) : 0
            };
            return usuarioRole;
        }

        public override List<BaseClass> BuildObjects(List<Dictionary<string, object>> lstRows)
        {
            var lstResults = new List<BaseClass>();

            foreach (var row in lstRows)
            {
                var usuarioRole = BuildObject(row);
                lstResults.Add(usuarioRole);
            }
            return lstResults;
        }
    }
}
