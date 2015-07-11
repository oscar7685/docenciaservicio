package com.docenciaservicio.controlador;

import com.docenciaservicio.controlador.sqlConnection.sqlController;
import com.docenciaservicio.entidades.Estudiante;
import com.docenciaservicio.entidades.Fuente;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.sessionbeans.EstudianteFacade;
import com.docenciaservicio.sessionbeans.FuenteFacade;
import com.docenciaservicio.sessionbeans.ProgramaFacade;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.sql.Result;
import javax.transaction.UserTransaction;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Prueba {

    ProgramaFacade programaFacade = lookupProgramaFacadeBean();
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();
    PrintWriter out;
    public boolean errorGlobal = false;

    public Prueba(File fileName, Proceso p, HttpServletResponse response) throws ParseException, IOException {
        out = response.getWriter();
        try {
            FileInputStream fileInputStream = new FileInputStream(fileName);
            XSSFWorkbook workBook = new XSSFWorkbook(fileInputStream);

            List cellDataList = new ArrayList();
            XSSFSheet hssfSheet = workBook.getSheetAt(0);
            Iterator rowIterator = hssfSheet.rowIterator();
            while (rowIterator.hasNext()) {

                XSSFRow hssfRow = (XSSFRow) rowIterator.next();
                List cellTempList = new ArrayList();//lista Temporal para agregar cada uno de los 6 datos de una fila

                for (int j = 0; j < 6; j++) {
                    XSSFCell hssfCell = (XSSFCell) hssfRow.getCell(j);
                    cellTempList.add(hssfCell);
                }

                if (!((cellTempList.get(0) == null)
                        && (cellTempList.get(1) == null)
                        && (cellTempList.get(2) == null)
                        && (cellTempList.get(3) == null)
                        && (cellTempList.get(4) == null)
                        && (cellTempList.get(5) == null))) {
                    cellDataList.add(cellTempList);
                }
            }
            Leer(cellDataList, 0, p);


        } catch (Exception e) {
            System.out.println("error aqui");
            e.printStackTrace();
        }
    }

    private void Leer(List cellDataList, int i0, Proceso pr) {
        boolean sapo = false; //avisa si ha ocurrido un error de validación
        String errores = "";
        List<Fuente> fuentes = new ArrayList<Fuente>();
        List<Estudiante> estudiantes = new ArrayList<Estudiante>();
        for (int i = 1; i < cellDataList.size(); i++) {
            Fuente f = new Fuente();
            Estudiante e = new Estudiante();
            List cellTempList = (List) cellDataList.get(i);
            for (int j = 0; j < cellTempList.size(); j++) {

                XSSFCell hssfCell = (XSSFCell) cellTempList.get(j);
                if (i0 == 0) {
                    if (j == 0) {// identificacion
                        try {
                            String aux = "" + new BigDecimal(Double.valueOf(hssfCell.getNumericCellValue())).toPlainString();
                            if (!aux.equals("0")) {
                                f.setIdUsuario(aux);
                                f.setPassword(aux);
                                f.setTipo("");
                            } else {
                                errores += "<br/>ha ocurrido un error de validación con la identificación en el registro #" + (i + 1);
                                sapo = true;
                            }

                        } catch (Exception exc0) {
                            errores += "<br/>ha ocurrido un error de validación con la identificación en el registro #" + (i + 1);
                            sapo = true;
                        }


                    } else if (j == 1) {//codigo_estudiantil
                        try {
                            String aux = "" + new BigDecimal(Double.valueOf(hssfCell.getNumericCellValue())).toPlainString();
                            if (!aux.equals("0")) {
                                e.setIdEstudiante(Integer.parseInt(aux));
                                e.setProcesoIdproceso(pr);
                            } else {
                                errores += "<br/>ha ocurrido un error de validación con el codigo estudiantil en el registro #" + (i + 1);
                                sapo = true;
                            }

                        } catch (Exception exc1) {
                            errores += "<br/>ha ocurrido un error de validación con el codigo estudiantil en el registro #" + (i + 1);
                            sapo = true;
                        }

                    } else if (j == 2) {//nombre
                        try {
                            if (!hssfCell.toString().equals("")) {
                                f.setNombre(hssfCell.toString());
                            } else {
                                errores += "<br/>ha ocurrido un error de validación con el nombre en el registro #" + (i + 1);
                                sapo = true;
                            }
                        } catch (Exception exc2) {
                            errores += "<br/>ha ocurrido un error de validación con el nombre en el registro #" + (i + 1);
                            sapo = true;
                        }
                    } else if (j == 3) {//apellidos
                        try {
                            if (!hssfCell.toString().equals("")) {
                                f.setApellido(hssfCell.toString());
                            } else {
                                errores += "<br/>ha ocurrido un error de validación con el apellido en el registro #" + (i + 1);
                                sapo = true;
                            }
                        } catch (Exception ex3) {

                            errores += "<br/>ha ocurrido un error de validación con el apellido en el registro #" + (i + 1);
                            sapo = true;
                        }
                    } else if (j == 4) {//semestre
                        try {
                            String aux[] = hssfCell.toString().split("\\.");
                            Integer.parseInt(aux[0]);
                            e.setSemestre(aux[0]);
                        } catch (Exception exc) {
                            errores += "<br/>ha ocurrido un error de validación con el semestre en el registro #" + (i + 1);
                            sapo = true;
                        }

                    } else if (j == 5) {//programa
                        try {
                            if (hssfCell.toString().equals("quimica farmaceutica")) {
                                e.setProgramaIdprograma(programaFacade.find(1));
                            } else if (hssfCell.toString().equals("medicina")) {
                                e.setProgramaIdprograma(programaFacade.find(2));
                            } else if (hssfCell.toString().equals("odontologia")) {
                                e.setProgramaIdprograma(programaFacade.find(3));
                            } else if (hssfCell.toString().equals("enfermeria")) {
                                e.setProgramaIdprograma(programaFacade.find(4));
                            } else {
                                errores += "<br/>ha ocurrido un error de validación con el programa en el registro #" + (i + 1);
                                sapo = true;
                            }
                        } catch (Exception dsf) {
                            errores += "<br/>ha ocurrido un error de validación con el programa en el registro #" + (i + 1);
                            sapo = true;
                        }

                    }

                }

            }

            if (i0 == 0) {
                if (f.getIdUsuario() != null) {
                    fuentes.add(f);
                    estudiantes.add(e);
                }

            }

        } //termina la hoja actual

        if (sapo) {
            errorGlobal = sapo;
            out.print("{\"errores\":\"" + errores + "\"}");
        }

        if (i0 == 0 && !sapo) {

            sqlController conSql = new sqlController();
            String sql = "";
            for (int i = 0; i < fuentes.size(); i++) {

                sql += "INSERT INTO `fuente` (`idUsuario`, `nombre`, `apellido`, `password`) VALUES ('" + fuentes.get(i).getIdUsuario() + "', '" + fuentes.get(i).getNombre() + "', '" + fuentes.get(i).getApellido() + "', '" + fuentes.get(i).getPassword() + "');";
                sql += "INSERT INTO `proceso_has_fuente` (`proceso_idproceso`, `fuente_idUsuario`) VALUES ('" + estudiantes.get(i).getProcesoIdproceso().getIdproceso() + "', '" + fuentes.get(i).getIdUsuario() + "');";
                sql += "INSERT INTO `estudiante` (`idEstudiante`, `semestre`, `programa_idprograma`, `proceso_idproceso`, `fuente_idUsuario`) VALUES ('" + estudiantes.get(i).getIdEstudiante() + "', '" + estudiantes.get(i).getSemestre() + "', '" + estudiantes.get(i).getProgramaIdprograma().getIdprograma() + "', '" + estudiantes.get(i).getProcesoIdproceso().getIdproceso() + "', '" + fuentes.get(i).getIdUsuario() + "');";
            }
            try {
                String error = conSql.UpdateSql(sql);
                if (error != null && !error.equals("")) {
                    errorGlobal = true;
                    out.print("{\"errores\":\"" + error + "\"}");
                }
            } catch (Exception ex) {
                errorGlobal = true;
                out.print("{\"errores\":\"" + "ha ocurrido un error desconocido" + "\"}");
                Logger.getLogger(Prueba.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private FuenteFacade lookupFuenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FuenteFacade) c.lookup("java:global/docenciaservicio/FuenteFacade!com.docenciaservicio.sessionbeans.FuenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EstudianteFacade lookupEstudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EstudianteFacade) c.lookup("java:global/docenciaservicio/EstudianteFacade!com.docenciaservicio.sessionbeans.EstudianteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ProgramaFacade lookupProgramaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProgramaFacade) c.lookup("java:global/docenciaservicio/ProgramaFacade!com.docenciaservicio.sessionbeans.ProgramaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}