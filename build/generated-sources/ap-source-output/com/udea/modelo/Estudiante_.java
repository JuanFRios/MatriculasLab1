package com.udea.modelo;

import com.udea.modelo.Materia;
import com.udea.modelo.Matricula;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-10-01T22:58:03")
@StaticMetamodel(Estudiante.class)
public class Estudiante_ { 

    public static volatile SingularAttribute<Estudiante, String> correo;
    public static volatile SingularAttribute<Estudiante, String> imagen;
    public static volatile CollectionAttribute<Estudiante, Materia> materiaCollection;
    public static volatile CollectionAttribute<Estudiante, Matricula> matriculaCollection;
    public static volatile SingularAttribute<Estudiante, String> contrasena;
    public static volatile SingularAttribute<Estudiante, Integer> id;
    public static volatile SingularAttribute<Estudiante, String> nombre;

}