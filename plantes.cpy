        ajouter_plante.
        DISPLAY " "
        DISPLAY "-- AJOUTER UNE PLANTE --"
        DISPLAY " "
        DISPLAY "Quel est le nom latin de la plante ?"
        ACCEPT nomLat
        DISPLAY "Quel est le nom vulgaire de la plante ?"
        ACCEPT nomVul
        DISPLAY "Quel est son suffixe ?"
        ACCEPT suffixe
        MOVE 0 TO Wfin
        MOVE 0 TO trouve
        MOVE nomVul TO fp_nomVulgaire
        MOVE suffixe TO fp_suffixe
        OPEN I-O FPlantes
        MOVE nomLat TO fp_nomLatin
        READ FPlantes
        INVALID KEY
                DISPLAY "Quel est le type de la plante ?"
                ACCEPT type_plante
                MOVE type_plante TO fp_type
                DISPLAY "Quel son ses besoin en eau ?"
                ACCEPT eau
                MOVE eau TO fp_eau
                DISPLAY "Quel exposition doit-elle avoir ?"
                ACCEPT soleil
                MOVE soleil TO fp_soleil
                DISPLAY "Sur quel sol pousse t-elle ?"
                ACCEPT sol
                MOVE sol TO fp_sol
                DISPLAY "Donner une courte description de la plante"
                ACCEPT description
                MOVE description TO fp_description
                WRITE tamp_fPlantes
                INVALID KEY DISPLAY tamp_fPlantes
                NOT INVALID KEY DISPLAY "ajout ok"
                END-WRITE
        NOT INVALID KEY
                DISPLAY "Plante d√©j√  existante"
        END-READ
        CLOSE FPlantes.

        afficher_plantes.
        DISPLAY " "
        DISPLAY "-- LISTE DES PLANTES PRESENTES DANS L'APPLICATION --"
        DISPLAY " "
        OPEN INPUT FPlantes
        MOVE 0 TO Wfin
        PERFORM WITH TEST AFTER UNTIL Wfin = 1
                READ FPlantes NEXT
                AT END
                        MOVE 1 TO Wfin
                NOT AT END
                        DISPLAY "Nom latin : " fp_nomLatin
                        DISPLAY "Nom commun : " fp_nomCommun
                        DISPLAY "Type plante : " fp_type
                        DISPLAY "Eau : " fp_eau
                        DISPLAY "Exposition : " fp_soleil
                        DISPLAY "Sol : " fp_sol
                        DISPLAY "Description : "
                        DISPLAY fp_description
                        DISPLAY "-------------------------------------"
                END-READ
        END-PERFORM
        CLOSE FPlantes.
