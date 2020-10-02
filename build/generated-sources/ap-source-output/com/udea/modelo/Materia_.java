package com.udea.modelo;

import com.udea.modelo.Estudiante;
import com.udea.modelo.Matricula;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-01T22:58:03")
@StaticMetamodel(Materia.class)
public class Materia_ { 

    public static volatile CollectionAttribute<Materia, Estudiante> estudianteCollection;
    public static volatile SingularAttribute<Materia, Integer> codigo;
    public static volatile CollectionAttribute<Materia, Matricula> matriculaCollection;
    public static volatile SingularAttribute<Materia, Integer> creditos;
    public static volatile SingularAttribute<Materia, String> nombre;
    public static volatile SingularAttribute<Materia, String> facultad;

}