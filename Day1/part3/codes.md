# Chapter 4 - Apex Code Snippets

---

## 1. Basic Apex Class

```apex
public class ApplicationService {

}
```

---

## 2. Apex Class with Method

```apex
public class ApplicationService {

    public void submitApplication(){

    }

}
```

---

## 3. Method with Parameters

```apex
public class ApplicationService {

    public void submitApplication(Id studentId, Id jobId){

    }

}
```

---

## 4. Method Returning Result

```apex
public class ApplicationService {

    public String submitApplication(Id studentId, Id jobId){

        return 'Application Submitted Successfully';

    }

}
```

---

## 5. Engineering Sprint 1

```apex
public with sharing class ApplicationService {

}
```

---

## 6. Engineering Sprint 2

```apex
public with sharing class ApplicationService {

    public static String submitApplication(Id studentId, Id jobId){

        return 'Application Request Received Successfully';

    }

}
```

---

## 7. Engineering Sprint 3

```apex
public with sharing class ApplicationService {

    public static String submitApplication(Id studentId, Id jobId){

        Boolean duplicateApplication = false;

        if(duplicateApplication){

            return 'Duplicate Application Found';

        }

        return 'Application Request Received Successfully';

    }

}
```

---

## 8. Engineering Sprint 4

```apex
public with sharing class ApplicationService {

    public static String submitApplication(Id studentId, Id jobId){

        Boolean duplicateApplication = false;
        Boolean eligible = true;

        if(duplicateApplication){

            return 'Duplicate Application Found';

        }

        if(!eligible){

            return 'Student Not Eligible';

        }

        return 'Application Request Received Successfully';

    }

}
```
