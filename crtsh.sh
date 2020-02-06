crtsh(){
        psql \
                -h crt.sh \
                -p 5432 \
                -U guest certwatch \
                -c "SELECT ci.NAME_VALUE NAME_VALUE FROM certificate_identity ci WHERE reverse(lower(ci.NAME_VALUE)) LIKE reverse(lowe
r('%.$1')) GROUP BY NAME_VALUE;" \
                | sed 's/\*\.//g' \
                | sed 's/ //g' \
                | grep `echo $1| awk -F '.' '{print \$1}'`
}
