        IDENTIFICATION DIVISION.
        PROGRAM-ID. projet_serres.
        
        ENVIRONMENT DIVISION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
        
                SELECT FPlantes ASSIGN TO "plantes.dat"
                ORGANIZATION indexed 
                ACCESS MODE IS dynamic
                RECORD KEY IS fp_nomLatin
                ALTERNATE RECORD KEY IS fp_nomCommun
                ALTERNATE RECORD KEY IS fp_nomVulgaire WITH DUPLICATES
                FILE STATUS IS cr_fPlantes.
                
                SELECT FUtilisateurs ASSIGN TO "utilisateurs.dat"
                ORGANIZATION indexed 
                ACCESS MODE IS dynamic
                RECORD KEY IS fu_idUtilisateur
                ALTERNATE RECORD KEY IS fu_mail
                FILE STATUS IS cr_fUtilisateurs.
                
                SELECT FSerres ASSIGN TO "serres.dat"
                ORGANIZATION indexed 
                ACCESS MODE IS dynamic
                RECORD KEY IS fs_nomSerre
                ALTERNATE RECORD KEY IS fs_idUtilisateur WITH DUPLICATES
                FILE STATUS IS cr_fSerres.
                
                SELECT FZones ASSIGN TO "zones.dat"
                ORGANIZATION indexed 
                ACCESS MODE IS dynamic
                RECORD KEY IS fz_cle
                ALTERNATE RECORD KEY IS fz_numZone
                ALTERNATE RECORD KEY IS fz_nomSerre WITH DUPLICATES
                FILE STATUS IS cr_fZones.
                
                SELECT FCompatibilites ASSIGN TO "compatibilite.dat"
                ORGANIZATION indexed 
                ACCESS MODE IS dynamic
                RECORD KEY IS fc_cle
                ALTERNATE RECORD KEY IS fc_nomLatin_1 WITH DUPLICATES
                ALTERNATE RECORD KEY IS fc_nomLatin_2 WITH DUPLICATES
                FILE STATUS IS cr_fCompatibilites.  
                
        DATA DIVISION.
        FILE SECTION.           
                
        FD FPlantes.
        01 tamp_fPlantes.
                02 fp_nomLatin PIC A(50).
                02 fp_nomCommun.
                        03 fp_nomVulgaire PIC A(30).
                        03 fp_suffixe PIC A(30).
                02 fp_type PIC A(20).
                02 fp_eau PIC A(10).
                02 fp_soleil PIC A(20).
                02 fp_sol PIC A(20).
                02 fp_description PIC A(255).
                
        FD FUtilisateurs.
        01 tamp_fUtilisateurs.
                02 fu_idUtilisateur PIC 9(3).
                02 fu_nom PIC A(30).
                02 fu_prenom PIC A(30).
                02 fu_mail PIC A(50).
                02 fu_type PIC A(10).
                
        FD FSerres.
        01 tamp_fSerres.
                02 fs_nomSerre PIC 9(3).
                02 fs_idUtilisateur PIC 9(3).
                02 fs_humidite PIC A(10).
                02 fs_exposition PIC A(20).

        FD FZones.
        01 tamp_fZones.
                02 fz_cle. 
                        03 fz_numZone PIC 9(3).
                        03 fz_nomSerre PIC 9(3).
                02 fz_nomLatin PIC A(50).
                02 fz_exposition PIC A(20).
                02 fz_sol PIC A(20).
                
        FD FCompatibilites.
        01 tamp_fCompatibilite.
                02 fc_cle.
                        03 fc_nomLatin_1 PIC A(50).
                        03 fc_nomLatin_2 PIC A(50).
                02 fc_affinite PIC 9(1).
                02 fc_description PIC A(255).

        WORKING-STORAGE SECTION.
        77 cr_fPlantes PIC 9(2).
        77 cr_fUtilisateurs PIC 9(2).
        77 cr_fSerres PIC 9(2).
        77 cr_fZones PIC 9(2).
        77 cr_fCompatibilites PIC 9(2).
        77 Wfin PIC 9(1).
        77 trouve PIC 9(1).
        77 nomLat PIC A(50).
        77 nomCom PIC A(50).
        77 nomVul PIC A(30).
        77 suffixe PIC A(30).
        77 type_plante PIC A(20).
        77 eau PIC A(10).
        77 soleil PIC A(20).
        77 sol PIC A(20).
        77 description PIC A(255).
        
        PROCEDURE DIVISION.
        
        OPEN I-O FPlantes
                IF cr_fPlantes=35 THEN
                OPEN OUTPUT FPlantes
                END-IF
        CLOSE FPlantes
        
        OPEN I-O FUtilisateurs
                IF cr_fUtilisateurs=35 THEN
                OPEN OUTPUT FUtilisateurs
                END-IF
        CLOSE FUtilisateurs
        
        OPEN I-O FSerres
                IF cr_fSerres=35 THEN
                OPEN OUTPUT FSerres
                END-IF
        CLOSE FSerres
        
        OPEN I-O FZones
                IF cr_fZones=35 THEN
                OPEN OUTPUT FZones
                END-IF
        CLOSE FZones
                
        OPEN I-O FCompatibilites
                IF cr_fCompatibilites=35 THEN
                OPEN OUTPUT FCompatibilites
                END-IF
        CLOSE FCompatibilites 
        PERFORM afficher_plantes
        PERFORM ajouter_plante
        STOP RUN.
        COPY "plantes.cpy".
