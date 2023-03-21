        ajouter_serre.
        OPEN I-O FSerres
        DISPLAY "---------- AJOUTER UNE SERRE ----------"

        DISPLAY "Veuillez d�finir les caract�ristiques de votre serre"
        MOVE 0 TO choix
        PERFORM WITH TEST AFTER UNTIL choix > 0 AND choix < 4
            DISPLAY "exposition directe:1 indirecte:2 mi_ombre:3"
            ACCEPT choix
        END-PERFORM
        IF choix = 1
            MOVE "directe" TO exposition
        ELSE IF choix = 2
            MOVE "indirecte" TO exposition
        ELSE MOVE "mi-ombre" TO exposition
        END-IF
        MOVE 0 TO choix
        PERFORM WITH TEST AFTER UNTIL choix > 0 AND choix < 4
            DISPLAY "humidit� faible:1 mod�r�e:2 �lev�e:3"
            ACCEPT choix
        END-PERFORM
        IF choix = 1
            MOVE "faible" TO humidite
        ELSE IF choix = 2
            MOVE "mod�r�e" TO humidite
        ELSE MOVE "�lev�e" TO humidite
        END-IF
        MOVE 0 TO choix
        PERFORM WITH TEST AFTER UNTIL choix > 0 AND choix < 5
            DISPLAY "sol argileux:1 sableux:2 calcaire:3 4:humif�re"
            DISPLAY "|*| Tips :"
            DISPLAY " * Argileux, est une terre qui s'agglom�re en"
                        " p�te dense."
            DISPLAY " * Sableux, est une terre qui s'effrite et ne "
                  "s'agglom�re pas."
            DISPLAY " * Calcaire, est une terre blanch�tre."
            DISPLAY " * Humif�re est une terre brune ou noir,"
                        " grumeleuse, riche en d�bris v�g�taux"
            ACCEPT choix
        END-PERFORM
        IF choix = 1
            MOVE "argileux" TO sol
        ELSE IF choix = 2
            MOVE "sableux" TO sol
        ELSE IF choix = 3
            MOVE "calcaire" TO sol
        ELSE MOVE "humif�re" TO sol
        END-IF

        DISPLAY "Combien de zone cultivable souhaitez-vous"
                " ajouter �  cette serre ? : "
        ACCEPT nbZones
        MOVE 0 TO choix
        DISPLAY "Voulez-vous cr�er serre ?"
           "oui:1 non:2"

        PERFORM ajouter_zone
           VARYING i
           FROM 0 BY 1 UNTIL i = nbZones

        DISPLAY "Quel est le nom de votre serre ? : "
        ACCEPT fs_nomSerre
        MOVE id_uti TO fs_idUtilisateur
        READ FSerres
                INVALID KEY
                   MOVE humidite TO fs_humidite
                   MOVE exposition TO fs_exposition
                   WRITE tamp_fSerres
                        INVALID KEY DISPLAY tamp_fSerres
                        NOT INVALID KEY DISPLAY "La serre � �t� cr��e"
                   END-WRITE
                NOT INVALID KEY DISPLAY "Nom de serre indisponible"
        END-READ
        CLOSE FSerres.


        afficher_serres.
        DISPLAY " "
        DISPLAY "-- VOICI VOS SERRES --"
        DISPLAY " "
        OPEN INPUT FSerres
        MOVE 0 TO Wfin
        PERFORM WITH TEST AFTER UNTIL Wfin = 1
                READ FSerres NEXT
                AT END
                        MOVE 1 TO Wfin
                NOT AT END
                        DISPLAY "Nom serre : " fs_nomSerre
                        DISPLAY "humidit� : " fs_humidite
                        DISPLAY "exposition : " fs_exposition
                        DISPLAY "-------------------------------------"
                END-READ
        END-PERFORM
        CLOSE FSerres.


        ajouter_zone.

           DISPLAY sol
        .
