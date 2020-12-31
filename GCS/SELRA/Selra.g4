grammar Selra ;


@header { 
import java.util.* ;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;

}

@members{

    public class Pair {

    private String x;
    private String y;


    public Pair(String x, String y) {
        this.x = x;
        this.y = y;
    }


    public String getFst() {
        return x;
    }

    public String getSnd() {
        return y;
    }


    public void setFst(String y) {
        this.y=y;
    }


    public void setSnd(String x) {
        this.x = x;
    }

    @Override
    public String toString() {
        return "Pair{" +
                "x='" + x + '\'' +
                ", y='" + y + '\'' +
                '}';
    }
}

    public class Student {

    private int id;
    private String name;
    private int age;
    private List<String> characteristics;
    private List<Resource>  resources;

    public Student(int id, String name, int age, List<String> characteristics, List<Resource> resources) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.characteristics = characteristics;
        this.resources = resources;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public List<String> getCharacteristics() {
        return characteristics;
    }

    public void setCharacteristics(List<String> characteristics) {
        this.characteristics = characteristics;
    }

    public List<Resource> getResources() {
        return resources;
    }

    public void setResources(List<Resource> resources) {
        this.resources = resources;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", characteristics=" + characteristics +
                ", resources=" + resources +
                '}';
    }

}

public class Language {
    
    private int id;
    private String name;


    public Language(int id, String name) {
        this.id = id;
        this.name = name;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    @Override
    public String toString() {
        return "Language{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}

public class Resource {


    private int id;
    private String name;
    private int age1;// Lower Bound
    private int age2;// Upper Bound 
    private String description;
    private List<String> characteristics;
    private Map<String,List<Pair>> contents;
    private float rate;


    public Resource(int id, String name, int age1,int age2, String description, List<String> characteristics, Map<String, List<Pair>> contents) {
        this.id = id;
        this.name = name;
        this.age1 = age1;
        this.age2 = age2;
        this.description = description;
        this.characteristics = characteristics;
        this.contents = contents;
        this.rate=0.0f;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getRate(){
        return this.rate;
    }

    public void setRate(float rate ){

        this.rate=rate;

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge1() {
        return age1;
    }


    public int getAge2() {
        return age2;
    }


    public void setAge1(int age) {
        this.age1 = age;
    }

     public void setAge2(int age) {
        this.age2 = age;
    }

    public String getDescription() {
        return description;
    }



    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getCharacteristics() {
        return characteristics;
    }

    public void setCharacteristics(List<String> characteristics) {
        this.characteristics = characteristics;
    }

    public Map<String, List<Pair>> getContents() {
        return contents;
    }

    public void setContents(Map<String, List<Pair>> contents) {
        this.contents = contents;
    }

    public String getColor(){
        String color="";

        if(rate>0 && rate <25)
            color="style=\"background-color:darkred;\"";

        if(rate>=25 && rate <50)
            color="style=\"background-color:orange;\"";

        if(rate>=50 && rate <75)
            color="style=\"background-color:yellow;\"";

        if(rate>=75 && rate <=100)
            color="style=\"background-color:lime;\"";

    return color;

    }


    @Override
    public String toString() {
        return "Resource{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", lower bound=" + age1 +
                ", upper bound=" + age2 +
                ", description='" + description + '\'' +
                ", characteristics=" + characteristics +
                ", contents=" + contents +
                ", rate=" + rate +

                '}';
    }



}
 
public void adequacyContent(Map <Integer,Student> students,Map <Integer,Resource> learnings){

    for(Student s : students.values()){
            int studentAge=s.getAge();
            List <String> studentCharac = s.getCharacteristics();

        for(Resource r : learnings.values()){
            int lb=r.getAge1();
            int ub=r.getAge2();
            List <String> resourceCharac = r.getCharacteristics();
            int resourceSize = resourceCharac.size();

            if(studentAge >=lb && studentAge<=ub){

                int count=0;

                for(String c: studentCharac){

                    if(resourceCharac.contains(c))
                        count++;
                    
                }
            
                float rate = ((float)count/resourceSize)*100;
                rate= (float)Math.round(rate * 100.0)/ (float)100.0;


                if(rate>0.0f){
                    r.setRate(rate);     
                    s.getResources().add(r);
                }

            }
                
        }

    }

}


public void writeLanguages(Map <Integer,Language> languages){

    String PATH = "/Users/etiennecosta/Desktop/Refactoring";
            String directoryName = PATH.concat("/SelraSite");
            String fileName =  "languages.html";
            String value = "";

            for(Language l : languages.values()){
                String name = l.getName();
                String id = String.valueOf(l.getId());

               value= value.concat(
                       "<div class=\"card\">" +
                               "<div class=\"card-header\">  " +
                               "<a class=\"card-link\" data-toggle=\"collapse\" href=\"#collapse"+id+"\"> " +
                               " "+name+"</a>" +
                               " </div> " +
                               "<div id=\"collapse"+id+"\" class=\"collapse \" data-parent=\"#accordion\"> <div class=\"card-body\"> " +
                               "<ul> " +
                               "<table id=\"tables\"> " +
                               "<tr> " +
                               "<th>ID</th> " +
                               "<th>Name</th> " +
                               "</tr> " +
                               "<tr> " +
                               "<td>"+id+"</td> " +
                               "<td>"+name+"</td> " +
                               "</tr> " +
                               "</table> " +
                               "</ul> " +
                               "</div> " +
                               "</div> " +
                               "</div>"
                        );


            }


            File directory = new File(directoryName);

            if (! directory.exists())
                directory.mkdir();


            File file = new File(directoryName + "/" + fileName);
            try{
                FileWriter fw = new FileWriter(file. getAbsoluteFile());
                BufferedWriter bw = new BufferedWriter(fw);
                String html = " <!DOCTYPE html> " +
                        "<html style=\"height: 100%;\" lang=\"en\"> " +
                        "<head> " +
                        "<title>Programming Languages</title> " +
                        "<link rel=\"icon\" href=\"images/logo.png\">" +
                        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"> " +
                        "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\"> " +
                        "<link rel=\"stylesheet\" href=\"css/index.css\"> " +
                        "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script> " +
                        "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script> " +
                        "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script> " +
                        "</head> " +
                        "<body style=\"height: 100%;\"> " +
                        "<div class=\"container\"> " +
                        "<h2 style=\"text-align: center;\">Programming Languages</h2><br> " +
                        "<p>A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p> " +
                        "<div id=\"accordion\">"+
                        value
                        +"</div> " +
                        "</div> " +
                        "<footer class=\"page-footer font-small unique-color-dark pt-4\">"+
                        "<div class=\"footer-copyright text-center py-3\">" +
                        "<a href=\"index.html\">Back to HomePage</a> " +
                    "</div> " +
                        "</footer> " +
                        "</body> " +
                        "</html>" ;
                bw.write(html);
                bw.close();
            }
            catch (IOException e){
                e.printStackTrace();
                System.exit(-1);
            }
}


/*  -------------------------------WRITE RESOURCES HTML PAGE -------------------------------------- */


public void writeResources (Map <Integer,Resource> resources){

       String PATH = "/Users/etiennecosta/Desktop/Refactoring";
            String directoryName = PATH.concat("/SelraSite");
            String fileName =  "resources.html";
            String value = "";

            for(Resource r : resources.values()){
                String name = r.getName();
                String id = String.valueOf(r.getId());
                String characteristics="";
                String contents="";
                List <String> keys= new ArrayList<>();
                
            for(String c : r.getCharacteristics())
                characteristics=characteristics.concat("<li>"+c+"</li>");


                value = value.concat(
                        "<div class=\"card\">" +
                                "<div class=\"card-header\">  " +
                                "<a class=\"card-link\" data-toggle=\"collapse\" href=\"#collapse" + id + "\"> " +
                                " " + name + "</a>" +
                                " </div> " +
                                "<div id=\"collapse" + id + "\" class=\"collapse \" data-parent=\"#accordion\"> <div class=\"card-body\"> " +
                                "<ul> " +
                                "<table id=\"tables\"> " +
                                "<tr> " +
                                "<th>ID</th> " +
                                "<th>Name</th> " +
                                "<th>Range</th> " +
                                "<th>Required Characteristics</th> " +
                                "</tr> " +
                                "<tr> " +
                                "<td>" + id + "</td> " +
                                "<td>" + name + "</td> " +
                                "<td>" + r.getAge1() + "-" + r.getAge2() + "</td> " +
                                "<td>" + characteristics + "</td> " +
                                "</tr> " +
                                "</table> "+
                                "<h1 style=\"text-align: center;\">Contents</h1>");

            for(String k : r.getContents().keySet())
                keys.add(k);

             for (String k : keys) {
                List<Pair> pairs = r.getContents().get(k);
                String pair = "";


                for (Pair p : pairs)
                    pair = pair.concat("<tr>" +
                            "<td>" + p.getFst() + "</td>" +
                            "<td>" +
                            "<a href=\"https://" + p.getSnd() + "\" target=\"_blank\">" + "Try it" + "</a>" +
                            "</td>" +
                            "</tr>");
             
                
                value = value.concat(
                                    "<div class=\"card\">" +
                                    "<div class=\"card-header\"> <a class=\"card-link\" data-toggle=\"collapse\" href=\"#collapse"+id+""+k+"\">"+k+"</a> " +
                                    "</div > " +
                                    "<div id =\"collapse"+id+""+k+"\" class=\"collapse \">"+
                                    "<div class=\"card-body\"> " +
                                    "<ul>" +
                                    "<table id =\"tables\"> " +
                                    "<tr> " +
                                    "<th > Concept </th > " +
                                    "<th > Url </th > " +
                                    "</tr>"+
                                    pair +
                                    "</table> " +
                                    "</ul> " +
                                    "</div> " +
                                    "</div> " +
                                    "</div>"
                        );

             }

                             value = value.concat("</div> " +
                                                  "</div>");


            
        }


            File directory = new File(directoryName);

            if (!directory.exists())
                directory.mkdir();


            File file = new File(directoryName + "/" + fileName);
            try {
                FileWriter fw = new FileWriter(file.getAbsoluteFile());
                BufferedWriter bw = new BufferedWriter(fw);
                String html = " <!DOCTYPE html> " +
                        "<html style=\"height: 100%;\" lang=\"en\"> " +
                        "<head> " +
                        "<title>Learning resources</title> " +
                        "<link rel=\"icon\" href=\"images/logo.png\">" +
                        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"> " +
                        "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\"> " +
                        "<link rel=\"stylesheet\" href=\"css/index.css\"> " +
                        "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script> " +
                        "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script> " +
                        "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script> " +
                        "</head> " +
                        "<body style=\"height: 100%;\"> " +
                        "<div class=\"container\"> " +
                        "<h2 style=\"text-align: center;\">Learning resources</h2><br> " +
                        "<p style=\"text-align:center\";>All activities are of an educational nature and will contribute to student learning.</p> " +
                        "<div id=\"accordion\">" +
                        value
                        + "</div> " +
                        "</div> " +
                        "</div> " +
                        "</div> " +
                        "</div> " +
                        "</div> " +
                        "</div> " +
                        "</div> " +

                        "<footer class=\"page-footer font-small unique-color-dark pt-4\">" +
                        "<div class=\"footer-copyright text-center py-3\">" +
                        "<a href=\"index.html\">Back to HomePage</a> " +
                        "</div> " +
                        "</footer> " +
                        "</body> " +
                        "</html>";
                bw.write(html);
                bw.close();
            } catch (IOException e) {
                e.printStackTrace();
                System.exit(-1);
            }

}


/*  -------------------------------WRITE STUDENTS HTML PAGE -------------------------------------- */


public void writeStudents (Map <Integer,Student> students){

       String PATH = "/Users/etiennecosta/Desktop/Refactoring";
            String directoryName = PATH.concat("/SelraSite");
            String fileName =  "students.html";
            String value = "";

            for(Student s : students.values()){

                String id = String.valueOf(s.getId());
                String name = s.getName();
                String characteristics="";
                String contents="";
                
            for(String c : s.getCharacteristics())
                characteristics=characteristics.concat("<li>"+c+"</li>");


                value = value.concat(
                                "<div class=\"card-header\">  " +
                                "<a class=\"card-link\" data-toggle=\"collapse\" href=\"#collapse" + id + "\"> " +
                                " " + name + "</a>" +
                                " </div> " +
                                "<div id=\"collapse" + id + "\" class=\"collapse \" data-parent=\"#accordion\"> <div class=\"card-body\"> " +
                                "<table id=\"tables\"> " +
                                "<tr> " +
                                "<th>ID</th> " +
                                "<th>Name</th> " +
                                "<th>Age</th> " +
                                "<th>Characteristics</th> " +
                                "</tr> " +
                                "<tr> " +
                                "<td>" + id + "</td> " +
                                "<td>" + name + "</td> " +
                                "<td>" + s.getAge()+"</td> " +
                                "<td>" + characteristics + "</td> " +
                                "</tr> " +
                                "</table> "+
                                "<h1 style=\"text-align: center;\"> Resources </h1>");

            List <Resource> resources= s.getResources();

            for(Resource r: resources){

                    String resourcename = r.getName();
                    int count =0;


                    for(String c: s.getCharacteristics()){

                    if(r.getCharacteristics().contains(c))
                        count++;
                    
                }
            


                float rate = ((float)count/r.getCharacteristics().size())*100;
                rate= (float)Math.round(rate * 100.0)/ (float)100.0;
                r.setRate(rate);

                String color=r.getColor();


                    value = value.concat( 
                        "<div class=\"card\">"+
                        "<div "+color+"class=\"card-header\"> <a class=\"card-link\" data-toggle=\"collapse\" href=\"#collapse"+id+""+resourcename+"\">"+resourcename+"</a> </div>"+
                        "<div id=\"collapse"+id+""+resourcename+"\" class=\"collapse\">"+
                        "<div class=\"card-body\">");

                    List <String> keys = new ArrayList<>();

                    for(String k : r.getContents().keySet())
                        keys.add(k);

                    
                    for(String k : keys){

                        List<Pair> pairs = r.getContents().get(k);
                        String pair = "";

                           for (Pair p : pairs)
                                pair = pair.concat("<tr>" +
                                "<td>" + p.getFst() + "</td>" +
                                "<td>" +
                                "<a href=\"https://" + p.getSnd() + "\" target=\"_blank\">" + "Try it" + "</a>" +
                                "</td>" +
                                "</tr>");

                         value = value.concat(
                                    "<div class=\"card\">" +
                                    "<div class=\"card-header\"> <a class=\"card-link\" data-toggle=\"collapse\" href=\"#collapse"+id+""+k+"\">"+k+"</a> " +
                                    "</div > " +
                                    "<div id =\"collapse"+id+""+k+"\" class=\"collapse \">"+
                                    "<div class=\"card-body\"> " +
                                    "<table id =\"tables\"> " +
                                    "<tr> " +
                                    "<th > Concept </th > " +
                                    "<th > Url </th > " +
                                    "</tr>"+
                                    pair +
                                    "</table> " +
                                    "</div> " +
                                    "</div> " +
                                    "</div>" );

                    }

        value = value.concat("</div> " +
                             "</div> " +
                             "</div>");

            }



        value = value.concat("</div> " +
                            "</div>");

            
        }


            File directory = new File(directoryName);

            if (!directory.exists())
                directory.mkdir();


            File file = new File(directoryName + "/" + fileName);
            try {
                FileWriter fw = new FileWriter(file.getAbsoluteFile());
                BufferedWriter bw = new BufferedWriter(fw);
                String html = " <!DOCTYPE html> " +
                        "<html style=\"height: 100%;\" lang=\"en\"> " +
                        "<head> " +
                        "<title>List of Students</title> " +
                        "<link rel=\"icon\" href=\"images/logo.png\">" +
                        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"> " +
                        "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\"> " +
                        "<link rel=\"stylesheet\" href=\"css/index.css\"> " +
                        "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script> " +
                        "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"></script> " +
                        "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script> " +
                        "</head> " +
                        "<body style=\"height: 100%;\"> " +
                        "<div class=\"container\"> " +
                        "<h2 style=\"text-align: center;\">List of Students</h2><br> " +
                        "<p style=\"text-align:center\";>Set of students who are interested in learning programming concepts using one or more learning resources.</p> " +
                        "<div id=\"accordion\">" +
                        "<div class=\"card\">" +

                        value

                        + "</div> " +
                        "</div> " +
                        "</div> " +
                       
                        "<footer class=\"page-footer font-small unique-color-dark pt-4\">" +
                        "<div class=\"footer-copyright text-center py-3\">" +
                        "<a href=\"index.html\">Back to HomePage</a> " +
                        "</div> " +
                        "</footer> " +
                        "</body> " +
                        "</html>";
                bw.write(html);
                bw.close();
            } catch (IOException e) {
                e.printStackTrace();
                System.exit(-1);
            }

}



}

// GRAMMAR

selra : OPEN SELRA CLOSE   students   languages   learnings   OPEN SLASH SELRA CLOSE {

                               adequacyContent($students.studentsOut,$learnings.learningsOut);


                               System.out.println("------------------------------------------- Students List -----------------------------------------");
                               for(Student s : $students.studentsOut.values())
                                  System.out.println(s.toString());

                               System.out.println("---------------------------------------------------------------------------------------------------");



                              System.out.println("------------ Languages List -------------");
                                for(Language l : $languages.languagesOut.values())
                                    System.out.println(l.toString());

                               System.out.println("-----------------------------------------");

                              System.out.println("------------ Resources List -------------");
                                 for(Resource r : $learnings.learningsOut.values())
                                    System.out.println(r.toString());

                              System.out.println("-----------------------------------------");



                               writeLanguages($languages.languagesOut);
                               writeResources($learnings.learningsOut);
                               writeStudents($students.studentsOut);

                                                                                     }
      ;


students returns [Map <Integer,Student> studentsOut] 
            
            @init {
                  $studentsOut = new HashMap<>();
                  }

            :  OPEN STUDENTS CLOSE    (student[$studentsOut])*   OPEN SLASH STUDENTS CLOSE  
            ;


student [Map <Integer,Student> studentsIn] :   OPEN STUDENT CLOSE   id    name   age    characteristics  OPEN SLASH STUDENT CLOSE   {


                                                int idStudent = $id.idOut;
                                                String nameStudent = $name.nameOut;
                                                int ageStudent = $age.ageOut;
                                                List <String> characteristicsStudents = $characteristics.characteristicsOut;
                                                boolean flagId = $studentsIn.containsKey(idStudent);


                                                if(!flagId) {
                                                 Student s = new Student(idStudent,nameStudent,ageStudent,characteristicsStudents,new ArrayList<Resource>());
                                                 $studentsIn.put(idStudent,s);
                                                 System.out.println("Student " +nameStudent+ " successfully added.\n");
                                
                                                         }

                                                else {
                                                      System.out.println("Semantic error: "+idStudent+ " This ID has already been assigned.\n");
                                                      System.out.println("Student was not inserted !\n");

                                                }         
                                                            }
                                                            ;


languages returns [Map <Integer,Language> languagesOut] 

            @init {
                        $languagesOut= new HashMap<>();

                 }
                 :   OPEN LANGUAGES CLOSE  (language[$languagesOut])*   OPEN SLASH LANGUAGES CLOSE  
                 ;


language [ Map<Integer,Language> languagesIn] 

            :   OPEN LANGUAGE CLOSE   id   name    OPEN SLASH LANGUAGE CLOSE {

                                                      int idLanguage = $id.idOut;
                                                      String nameLanguage = $name.nameOut;
                                                      boolean flagId = $languagesIn.containsKey(idLanguage);
                                                      boolean flagName = $languagesIn.containsValue(nameLanguage);


                                                  if(!flagId && !flagName) {
                                                        
                                                      Language l = new Language(idLanguage,nameLanguage);
                                                      $languagesIn.put(idLanguage,l);
                                                      System.out.println("Language " + nameLanguage + " successfully added.\n");
                                
                                                                         }

                                                else {

                                                         if(flagId){

                                                             System.out.println("Semantic error: "+idLanguage+ " This ID has already been assigned.\n");
                                                             System.out.println("Language was not inserted !\n");
                                                         }

                                                         else if (flagName){
                                                            System.out.println("Semantic error: "+nameLanguage+ " language has already been added.\n");
                                                             System.out.println("Language was not inserted !\n");  
                                                         }

                                                         else if ( flagName & flagId){
                                                         System.out.println("Semantic error: "+nameLanguage+ "and " + idLanguage + " has already been added.\n");
                                                         System.out.println("Language was not inserted !\n");

                                                         }

                                                     }   

                        }          
                        ;



learnings returns [ Map <Integer,Resource> learningsOut] 

            @init {
                        $learningsOut= new HashMap<>();

                 }

          :   OPEN LEARNINGS CLOSE   (learning[$learningsOut])*   OPEN SLASH LEARNINGS CLOSE  
          ;

learning [Map <Integer,Resource> learningsIn]  
          :   OPEN LEARNING CLOSE    id   name   range   description    characteristics   contents   OPEN SLASH LEARNING CLOSE  {


                                                                int idLearning = $id.idOut;
                                                                String nameLearning = $name.nameOut;
                                                                int ageLowerBound = $range.rangeOut.get(0);
                                                                int ageUpperBound = $range.rangeOut.get(1);
                                                                String descriptionLearning = $description.descriptionOut;
                                                                List <String> characteristicsLearning = $characteristics.characteristicsOut;
                                                                Map <String,List<Pair>> learningContents=$contents.contentsOut;

                                                                boolean flagId = $learningsIn.containsKey(idLearning);

                                                                Resource learningResource= new Resource(idLearning,nameLearning,ageLowerBound,ageUpperBound,descriptionLearning,characteristicsLearning,learningContents);


                                                                $learningsIn.put(idLearning,learningResource);
                                                
                                                                                          
                                                                                          }
          ;


id returns [int idOut] :  OPEN ID CLOSE   NUMBER   OPEN SLASH ID CLOSE {  $idOut = $NUMBER.int; }
   ;

name returns [String nameOut] :   OPEN NAME CLOSE   WORD   OPEN SLASH NAME CLOSE { $nameOut = $WORD.text;}
     ;

age returns [int ageOut] :  OPEN AGE CLOSE   NUMBER   OPEN SLASH AGE CLOSE  { $ageOut = $NUMBER.int;}
                         ;

characteristics returns [ List <String> characteristicsOut] 
                  @init{

                        $characteristicsOut = new ArrayList<>();

                      }
                  :  OPEN CHARACTERISTICS CLOSE   (characteristic[$characteristicsOut])*   OPEN SLASH CHARACTERISTICS CLOSE  
                  ;

characteristic[ List <String> characteristicsIn] :  OPEN CHARACTERISTIC CLOSE   WORD   OPEN SLASH CHARACTERISTIC CLOSE  {

                                                String c = $WORD.text;

                                                if($characteristicsIn.contains(c)){
                                                      System.out.println("Semantic Error: " +c+ " feature has already been added.\n");
                                                      System.out.println("Feature " +c+ " not added.\n");
                                                }

                                                else {
                                                      $characteristicsIn.add(c);
                                                      System.out.println("Feature " +c+ " successfully added.\n");
                                                    
                                                    }

                                             }
                                             ;

range returns [List<Integer> rangeOut] 
            @init {
                  $rangeOut = new ArrayList<>();
                  }

            :   OPEN RANGE CLOSE   lowerbound[$rangeOut]   upperbound[$rangeOut]   OPEN SLASH RANGE CLOSE  
            ;

lowerbound[ List<Integer> rangeIn ]:   OPEN LOWERBOUND CLOSE   NUMBER   OPEN SLASH LOWERBOUND CLOSE  { $rangeIn.add($NUMBER.int);}
          ;

upperbound[ List<Integer> rangeIn  ]:   OPEN UPPERBOUND CLOSE   NUMBER   OPEN SLASH UPPERBOUND CLOSE  { $rangeIn.add($NUMBER.int);}
          ;

description returns [String descriptionOut] :   OPEN DESCRIPTION CLOSE   WORD   OPEN SLASH DESCRIPTION CLOSE   { $descriptionOut = $WORD.text; }
                                            ;


contents returns [ Map <String,List<Pair>> contentsOut] 
            @init {
                   $contentsOut=new HashMap<>();
                 }


                  :  OPEN CONTENTS CLOSE    (content[$contentsOut])*   OPEN SLASH CONTENTS CLOSE 
                  ;


content[ Map <String,List<Pair>> contentsIn] :  OPEN CONTENT CLOSE   name   concepts   OPEN SLASH CONTENT CLOSE {


                                                      String contentTheme = $name.nameOut;
                                                      List <Pair> contentPair = $concepts.conceptsOut;


                                                        if($contentsIn.containsKey(contentTheme)){

                                                            System.out.println("Semantic Error: " +contentTheme+ " feature has already been added.");
                                                            System.out.println("Content " +contentTheme+ " not added.");

                                                        }

                                                        else    {

                                                            $contentsIn.put(contentTheme,contentPair);
                                                          System.out.println("Content " +contentTheme+ " successfully added.");

                                                        }

                                                            }
                                             ;

concepts returns [ List <Pair> conceptsOut]
            @init {
                $conceptsOut = new ArrayList<>();
            } 
            :  OPEN CONCEPTS CLOSE   (concept[$conceptsOut])*   OPEN SLASH CONCEPTS CLOSE  
            ;

concept[List<Pair> conceptsIn]  :  OPEN CONCEPT CLOSE   name   link   OPEN SLASH CONCEPT CLOSE  {

                                                                            String theme = $name.nameOut;
                                                                            String link  = $link.linkOut;

                                                                            Pair p = new Pair(theme,link);

                                                                            if ($conceptsIn.contains(p)){

                                                                               System.out.println("Semantic Error: " +p.toString()+ " feature has already been added.");
                                                                               System.out.println("Feature " +p.toString()+ " not added.");

                                                                            }


                                                                            else {

                                                                                  $conceptsIn.add(p);
                                                                                  System.out.println("Feature " +p.toString()+ " successfully added.");

                                                                            }





                                                                                                }
        ;



link returns [String linkOut] :  OPEN LINK CLOSE   WORD    OPEN SLASH LINK CLOSE  {$linkOut = $WORD.text;}
                              ;


// LEXER 

OPEN : '<'
     ;

CLOSE : '>'
      ;

SLASH : '/'
      ;

SELRA : 'selra'
      ;

STUDENTS : 'students'
         ;

STUDENT : 'student'
        ;

LANGUAGES : 'languages'
          ;

LANGUAGE : 'language'
         ;

LEARNINGS : 'learnings'
          ;

LEARNING : 'learning'
          ;

ID : 'id'
   ;

NAME : 'name'
     ;

AGE : 'age'
    ;

CHARACTERISTICS : 'characteristics'
                ;

CHARACTERISTIC : 'characteristic'
               ;


RANGE : 'range'
      ;

LOWERBOUND : 'lowerbound'
           ;

UPPERBOUND : 'upperbound'
           ;

DESCRIPTION : 'description'
            ;


CONTENTS : 'contents'
         ;

CONTENT : 'content'
        ;

CONCEPTS : 'concepts'
         ;

CONCEPT : 'concept'
        ;

LINK : 'url'
     ;

NUMBER : [0-9]+
       ;

WORD   : [A-Za-z .]+
       ;

WS : [\n\r\t ]+ -> skip 
   ;