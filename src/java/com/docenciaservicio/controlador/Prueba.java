package com.docenciaservicio.controlador;

import com.docenciaservicio.entidades.Estudiante;
import com.docenciaservicio.entidades.Fuente;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.sessionbeans.EstudianteFacade;
import com.docenciaservicio.sessionbeans.FuenteFacade;
import com.docenciaservicio.sessionbeans.ProgramaFacade;
import java.io.File;
import java.io.FileInputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
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

    public Prueba(File fileName, Proceso p) throws ParseException {

        try {
            FileInputStream fileInputStream = new FileInputStream(fileName);
            XSSFWorkbook workBook = new XSSFWorkbook(fileInputStream);
            for (int i = 0; i < 3; i++) {
                List cellDataList = new ArrayList();
                XSSFSheet hssfSheet = workBook.getSheetAt(i);
                Iterator rowIterator = hssfSheet.rowIterator();
                while (rowIterator.hasNext()) {

                    XSSFRow hssfRow = (XSSFRow) rowIterator.next();


                    if (i == 0) {
                        Iterator iterator = hssfRow.cellIterator();
                        List cellTempList = new ArrayList();
                        for (int j = 0; j < 6; j++) {
                            XSSFCell hssfCell = (XSSFCell) hssfRow.getCell(j);
                            if (hssfCell != null) {
                                cellTempList.add(hssfCell);
                            }

                        }
                        if (cellTempList.size() != 0) {
                            cellDataList.add(cellTempList);
                        }
                    } else {
                        if (i == 1) {
                            Iterator iterator = hssfRow.cellIterator();
                            List cellTempList = new ArrayList();
                            for (int j = 0; j < 5; j++) {
                                XSSFCell hssfCell = (XSSFCell) hssfRow.getCell(j);
                                if (hssfCell != null) {
                                    cellTempList.add(hssfCell);
                                }

                            }
                            if (cellTempList.size() != 0) {
                                cellDataList.add(cellTempList);
                            }

                        } else {
                            if (i == 2) {
                                Iterator iterator = hssfRow.cellIterator();
                                List cellTempList = new ArrayList();
                                for (int j = 0; j < 4; j++) {
                                    XSSFCell hssfCell = (XSSFCell) hssfRow.getCell(j);
                                    if (hssfCell != null) {
                                        cellTempList.add(hssfCell);
                                    }
                                }
                                if (cellTempList.size() != 0) {
                                    cellDataList.add(cellTempList);
                                }
                            }

                        }
                    }

                }
                Leer(cellDataList, i, p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void Leer(List cellDataList, int i0, Proceso pr) {
        List<Fuente> fuentes = new ArrayList<Fuente>();
        List<Estudiante> estudiantes = new ArrayList<Estudiante>();
        for (int i = 1; i < cellDataList.size(); i++) {
            Fuente f = new Fuente();
            Estudiante e = new Estudiante();
            List cellTempList = (List) cellDataList.get(i);
            for (int j = 0; j < cellTempList.size(); j++) {
                XSSFCell hssfCell = (XSSFCell) cellTempList.get(j);
                if (i0 == 0) {
                    if (j == 0) {
                        String aux[] = hssfCell.toString().split("\\.");
                        f.setIdUsuario(Integer.parseInt(aux[0]));
                        f.setPassword(aux[0]);
                        f.setTipo("");

                    } else if (j == 1) {
                        String aux[] = hssfCell.toString().split("\\.");
                        e.setIdEstudiante(Integer.parseInt(aux[0]));
                        e.setProcesoIdproceso(pr);
                    } else if (j == 2) {
                        f.setNombre(hssfCell.toString());
                    } else if (j == 3) {
                        f.setApellido(hssfCell.toString());
                    } else if (j == 4) {
                        String aux[] = hssfCell.toString().split("\\.");
                        e.setSemestre(aux[0]);
                    } else if (j == 5) {
                        e.setProgramaIdprograma(programaFacade.find(1));
                    }

                }

            }
            if (i0 == 0) {
                fuentes.add(f);
                estudiantes.add(e);
            }
        }
        if (i0 == 0) {
            fuenteFacade.insertarFuente(fuentes);
            for (int k = 0; k < fuentes.size(); k++) {
                estudiantes.get(k).setFuenteidUsuario(fuenteFacade.find(fuentes.get(k).getIdUsuario()));
            }
            estudianteFacade.insertarEstudiantes(estudiantes);
        }
    }

    /* public static void main(String[] args) throws ParseException {
     File f = new File("C:/formato_poblacion.xlsm");
     if (f.exists()) {
     Prueba pb = new Prueba(f);
     }
     }*/
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