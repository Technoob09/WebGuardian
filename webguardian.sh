#!/bin/bash
#WebGuardian - Automated Web Security Sentinel Suite (version 1.0)
#Contributers:

#>>>>COLORS
BL="\e[1;35m"
RD="\e[31m"
YL="\e[1;33m"
ED="\e[0m"


#>>>>CHECK CONNECTION
wget -q --spider http://google.com
if [ $? -ne 0 ];then
    echo -e "\e[31mOOPS!!!\e[0m" "[You are offline connect to internet to become WebGuardian]"
    exit 127
fi


#>>>>VARIABLES
D=
X=
V="WebGuardian v1.0"
S=False
J=False
O=False
P="21,22,80,81,280,300,443,583,591,593,832,981,1010,1099,1311,2082,2087,2095,2096,2480,3000,3128,3333,4243,4444,4445,4567,4711,4712,4993,5000,5104,5108,5280,5281,5601,5800,6543,7000,7001,7002,7396,7474,8000,8001,8008,8009,8014,8042,8060,8069,8080,8081,8083,8088,8090,8091,8095,8118,8123,8172,8181,8222,8243,8280,8281,8333,8337,8443,8500,8530,8531,8834,8880,8887,8888,8983,9000,9001,9043,9060,9080,9090,9091,9092,9200,9443,9502,9800,9981,10000,10250,10443,11371,12043,12046,12443,15672,16080,17778,18091,18092,20720,28017,32000,55440,55672"
url1="https://github.com/Divya-03s"
url2="https://github.com/yuvrajgohil24"
url3="https://github.com/Kanishk-Malav"
url4="https://github.com/technoob07"
url5="https://github.com/Technoob09/"


#>>>>USAGE
PRINT_USAGE(){
    echo -e ""
    echo -e "${BL}
\t\t ██╗    ██╗███████╗██████╗  ██████╗ ██╗   ██╗ █████╗ ██████╗ ██████╗ ██╗ █████╗ ███╗   ██╗
\t\t ██║    ██║██╔════╝██╔══██╗██╔════╝ ██║   ██║██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗████╗  ██║
\t\t ██║ █╗ ██║█████╗  ██████╔╝██║  ███╗██║   ██║███████║██████╔╝██║  ██║██║███████║██╔██╗ ██║
\t\t ██║███╗██║██╔══╝  ██╔══██╗██║   ██║██║   ██║██╔══██║██╔══██╗██║  ██║██║██╔══██║██║╚██╗██║
\t\t ╚███╔███╔╝███████╗██████╔╝╚██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝██║██║  ██║██║ ╚████║
\t\t  ╚══╝╚══╝ ╚══════╝╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝                                                                                    
${ED}"
    echo -e "\t\t\t     ----: [WebGuardian] == Automated Web Security Sentinel Suite :----     "
    echo -e "\e[1m\e[4m${BL}Contributors: ${ED}"
    echo -e "${YL}Singh Divya Madan${ED}: [ $url1 ]"
    echo -e "${YL}Yuvraj Singh Gohil${ED}: [ $url2 ]"
    echo -e "${YL}Kanishk Malav${ED}: [ $url3 ]"
    echo -e "${YL}Tushar Joshi${ED}: [ $url4 ]"
    echo -e "${YL}Taukir Ahmed${ED}: [ $url5 ]"
    echo -e ""
    echo -e ""
    echo -e "\e[31mCAUTION!!!\e[0m" "[Please first run "requirement.sh" file to get all the tools in your suite]"
    echo -e ""
    echo -e ""
    echo -e "\e[1m\e[4m${BL}Example Usage: ${ED}"
    echo -e ""
    echo -e "   webguardian [-d target_domain] [--json] [--silent]"
    echo -e ""
    echo -e ""
    echo -e "\e[1m\e[4m${BL}Flags: ${ED}"
    echo -e ""
    echo -e "   -d, --domain                            Provide target domain"                
    echo -e "   -x, --exclude                           Provide domain that are out of scope"                
    echo -e ""
    echo -e ""
    echo -e "\e[1m\e[4m${BL}Optional Flags: ${ED}"
    echo -e ""
    echo -e "   -s, --silent                            Hide output in the terminal"             
    echo -e "   -j, --json                              Store output in a single json file"      
    echo -e "   -v, --version                           Show version of WebGuardian"
    exit 0
}


#>>>>ARGUMENTS
while [ -n "$1" ]; do
    case $1 in
            -d|--domain)
                D=$2
                shift ;;

            -h|--help)
                PRINT_USAGE
                shift ;;

            -j|--json)
                J='true'
                ;;

            -s|--silent)
                S='true'
                ;;

            -x|--exclude)
                X=$2
                shift ;;

            -v|--version)
                echo -e "$V"
                exit 0 ;;

            *)
                PRINT_USAGE
    esac
    shift
done


#>>>>INITIAL CONFIGS
if [ -z "$D" ]; then
    echo -e "\n${RD}ERROR${ED} - TARGET NOT SUPPLIED."
    PRINT_USAGE
fi

if [ "$O" == "true" ]; then
    J='true'
fi


#>>>>DOCKER
if [ -z "$CHROME_BIN" ]; then
    CHROME_BIN="/snap/bin/chromium"
fi


#>>>>EXIT
trap ctrl_c INT
ctrl_c(){
    echo -e ""
    echo -e "${RD} [!] ${ED} KEYBOARD INTERRUPTION, ${YL}EXITING WebGuardian${ED}..."
    exit 127
}


#>>>>BANNER
INFOM(){
    clear
    echo -e ""
    echo -e "${BL}
\t\t ██╗    ██╗███████╗██████╗  ██████╗ ██╗   ██╗ █████╗ ██████╗ ██████╗ ██╗ █████╗ ███╗   ██╗
\t\t ██║    ██║██╔════╝██╔══██╗██╔════╝ ██║   ██║██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗████╗  ██║
\t\t ██║ █╗ ██║█████╗  ██████╔╝██║  ███╗██║   ██║███████║██████╔╝██║  ██║██║███████║██╔██╗ ██║
\t\t ██║███╗██║██╔══╝  ██╔══██╗██║   ██║██║   ██║██╔══██║██╔══██╗██║  ██║██║██╔══██║██║╚██╗██║
\t\t ╚███╔███╔╝███████╗██████╔╝╚██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝██║██║  ██║██║ ╚████║
\t\t  ╚══╝╚══╝ ╚══════╝╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝                                                                                    
${ED}"
    echo -e "\t\t\t     ----: [WebGuardian] == Automated Web Security Sentinel Suite :----     "
    OT=$(echo -e "$(echo $D | sed -e 's/\.[a-z]*$//')_$(date +"%Y_%M_%d-%H_%M_%S")")
    mkdir -p $OT 2> /dev/null
    cd $OT
    echo -e ""
    echo -e "${YL}DOMAIN> ${ED}" | tr -d "\n"; echo -e " $D" | pv -qL 6
    echo -e "${YL}OUTPUT> ${ED}" | tr -d "\n"; echo -e " $(pwd | sed 's/\// < /g' | cut -c 4-)" | pv -qL 6
    echo -e "${YL}[WebGuardian] ${ED} - Scanning started on $D at $(date)" | notify -silent
}


#>>>>MAKING DIRECTORIES
MAKDR(){
    mkdir -p .tmp
    mkdir -p Subdomain
    mkdir -p Web_Crawling
    mkdir -p GF
    mkdir -p Nuclie
    mkdir -p Vulnerable
    mkdir -p Directories
    
    [ "$J" == "False" ] || mkdir -p .json
}


#>>>>SUBDOMAIN ENUMERATION
PASSIVE_ENUM(){
    curl -s "https://crt.sh/?q=%25.$D&output=json" | jq -r '.[].name_value' 2>/dev/null | sed 's/\*\.//g' | sort -u | grep -o "\w.*$D" | anew -q .tmp/cert.txt
    curl -s "https://api.hackertarget.com/hostsearch/?q=$D" | grep -o "\w.*$D" | anew -q .tmp/htarget.txt
    subfinder -d $D -t 100 -v -o .tmp/Subfinder.txt &> /dev/null
    amass enum -passive -d $D -o .tmp/tempamass.txt -v | grep -Eo '([a-zA-Z0-9.-]+.)*'$D | sort -u | tee .tmp/PassiveAmaas.txt && rm -rf .tmp/tempamasspas.txt &> /dev/null
    assetfinder -subs-only $D | tee .tmp/Assetfinder.txt &> /dev/null
    python3 ~/tools/Sublist3r/sublist3r.py -d $D -o .tmp/Sublister.txt &> /dev/null
} 

ACTIVE_ENUM(){
    ffuf -u http://FUZZ.$D -t 100 -p '1.0-2.0' -w ~/wordlists/subdomains.txt -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36" -mc 200 -r -o .tmp/ffuf.json -s 2> /dev/null &> /dev/null
    cat .tmp/ffuf.json 2> /dev/null | jq -r '.results[] | .host' 2> /dev/null | anew -q .tmp/ffuf.txt && rm -rf .tmp/ffuf.json &> /dev/null
    amass enum -active -brute -w ~/wordlists/subdomains.txt -d $D -o .tmp/tempamassact.txt | grep -Eo '([a-zA-Z0-9.-]+.)*'$D | sort -u | tee .tmp/BruteAmass.txt && rm -rf .tmp/tempamassact.txt &> /dev/null
    gobuster dns -d $D -w ~/wordlists/subdomains.txt --wildcard -o .tmp/Gobuster.txt &> /dev/null
}

RESOLVE_DOMAINS(){
    if [ -f "$X" ]; then
        cat .tmp/*.txt | grep -v "*" | grep -vf $X | sort -u | sed '/@\|<BR>\|\_\|*/d' | dnsx -a -aaaa -cname -ns -ptr -mx -soa -retry 3 -r ~/wordlists/resolvers.txt -t 10 -silent | anew -q Subdomain/subdomains.txt
    else
        cat .tmp/*.txt | grep -v "*" | sort -u | sed '/@\|<BR>\|\_\|*/d' | dnsx -a -aaaa -cname -ns -ptr -mx -soa -retry 3 -r ~/wordlists/resolvers.txt -t 10 -silent | anew -q Subdomain/subdomains.txt
    fi
}

ALIVE_DOMAINS(){
    naabu -retries 3 -r ~/wordlists/resolvers.txt -l Subdomain/subdomains.txt -p "$P" -silent -no-color 2> /dev/null | anew -q Subdomain/ports.txt  &> /dev/null
    cat Subdomain/ports.txt | httprobe -prefer-https | anew -q Subdomain/lives.txt  &> /dev/null
    xargs -a Subdomain/lives.txt -P 50 -I % bash -c "echo % | aquatone -chrome-path $CHROME_BIN -out Subdomain/screenshots/ -threads 10 -silent" 2> /dev/null &> /dev/null
    [ "$J" == "False" ] || cat Subdomain/lives.txt | python3 -c "import sys; import json; print (json.dumps({'liveurls':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/liveurls.json &> /dev/null
    [ "$J" == "False" ] || cat Subdomain/subdomains.txt | python3 -c "import sys; import json; print (json.dumps({'subdomains':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/subdomains.json &> /dev/null
    [ "$J" == "False" ] || cat Subdomain/ports.txt | python3 -c "import sys; import json; print (json.dumps({'ports':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/ports.json &> /dev/null
}

SUBDOMAIN_SCAN(){
    echo -e ""
    echo -e "${RD}        ${ED}" | tr -d '\n' | pv -qL 4; echo -e " STARTING SUBDOMAIN SCANNING ON ${BL}$D${ED} (${YL}sit back and relax....${ED})" | notify -silent
    PASSIVE_ENUM
    ACTIVE_ENUM
    RESOLVE_DOMAINS
    ALIVE_DOMAINS
    [ "$S" == "False" ] && cat Subdomain/lives.txt 2> /dev/null
    echo -e "Subdomain enumeration completed, total [Subdomains:$(cat Subdomain/subdomains.txt | wc -l)  Activeurls:$(cat Subdomain/lives.txt | wc -l)] found" | notify -silent 
}


#>>>>WEB CRAWLING
WEB_ENUM(){
    echo -e "${RD}        ${ED}" | tr -d '\n' | pv -qL 6; echo -e " STARTING WEBCRAWLING ON ${BL}$D${ED} (${YL}sit back and relax....${ED})" | notify -silent
    agnee -d $D -q -o Web_Crawling/dorks.txt -p 4
    gospider -S Subdomain/lives.txt -d 10 -c 20 -t 50 -K 3 --no-redirect --js -a -w --blacklist ".(eot|jpg|jpeg|gif|css|tif|tiff|png|ttf|otf|woff|woff2|ico|svg|txt)" --include-subs -q -o .tmp/gospider 2> /dev/null | anew -q .tmp/gospider.txt
    katana -list Subdomain/lives.txt -jc -d 4 -o .tmp/katana 2> /dev/null | anew -q .tmp/katana.txt
    xargs -a Subdomain/lives.txt -P 50 -I % bash -c "echo % | waybackurls" 2> /dev/null | anew -q .tmp/waybackurls.txt
    xargs -a Subdomain/lives.txt -P 50 -I % bash -c "echo % | gau --blacklist eot,jpg,jpeg,gif,css,tif,tiff,png,ttf,otf,woff,woff2,ico,svg,txt --retries 3 --threads 50" 2> /dev/null | anew -q .tmp/gau.txt 2> /dev/null &> /dev/null
    cat .tmp/gospider.txt .tmp/gau.txt .tmp/waybackurls.txt .tmp/katana.txt 2> /dev/null | sed '/\[/d' | grep $D | sort -u | uro | anew -q Web_Crawling/urls.txt 
    [ "$J" == "False" ] || cat Web_Crawling/urls.txt | python3 -c "import sys; import json; print (json.dumps({'endpoints':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/urls.json &> /dev/null

    gf xss Web_Crawling/urls.txt | sed "s/'\|(\|)//g" | bhedak "FUZZ" 2> /dev/null | anew -q GF/tempxss.txt
    gf lfi Web_Crawling/urls.txt | sed "s/'\|(\|)//g" | bhedak "FUZZ" 2> /dev/null | anew -q GF/lfi.txt
    gf rce Web_Crawling/urls.txt | sed "s/'\|(\|)//g" | bhedak "FUZZ" 2> /dev/null | anew -q GF/rce.txt
    gf ssrf Web_Crawling/urls.txt | sed "s/'\|(\|)//g" | bhedak "http://169.254.169.254/latest/meta-data/hostname" 2> /dev/null | anew -q GF/ssrf.txt
    gf ssti Web_Crawling/urls.txt | sed "s/'\|(\|)//g" | bhedak "FUZZ" 2> /dev/null | anew -q GF/ssti.txt
    gf sqli Web_Crawling/urls.txt | sed "s/'\|(\|)//g" | bhedak "(select(0)from(select(sleep(5)))v)" 2> /dev/null | anew -q GF/sqli.txt
    gf redirect Web_Crawling/urls.txt | sed "s/'\|(\|)//g" | bhedak "http://www.evil.com/" 2> /dev/null | anew -q GF/redirect.txt

    xargs -a GF/tempxss.txt -P 30 -I % bash -c "echo % | kxss" 2> /dev/null | grep "< >\|\"" | awk '{print $2}' | anew -q .tmp/xssp.txt
    cat .tmp/xssp.txt 2> /dev/null | bhedak "\">/><svg/onload=confirm(document.domain)>" 2> /dev/null | anew -q GF/xss.txt

}

#>>>>VULNERABILITY SCANNING
NUCLIE_SCAN(){
    echo -e "${RD}        ${ED}" | tr -d '\n' | pv -qL 6; echo -e " STARTING NUCLEI VULNERABILITY SCANNING ON ${BL}$D${ED} (${YL}sit back and relax....${ED})" | notify -silent
    nuclei -update-templates 2> /dev/null &> /dev/null
    xargs -a Subdomain/lives.txt -P 50 -I % bash -c "nuclei -target % -t ~/nuclei-templates/ -nc -s info -c 10 -silent" 2> /dev/null | anew -q Nuclie/nuclei.txt
    xargs -a Subdomain/lives.txt -P 50 -I % bash -c "nuclei -target % -t ~/nuclei-templates/ -nc -s low -c 10 -silent" 2> /dev/null | anew Nuclie/nuclei.txt | notify -silent &> /dev/null
    xargs -a Subdomain/lives.txt -P 50 -I % bash -c "nuclei -target % -t ~/nuclei-templates/ -nc -s medium -c 10 -silent" 2> /dev/null | anew Nuclie/nuclei.txt | notify -silent &> /dev/null
    xargs -a Subdomain/lives.txt -P 50 -I % bash -c "nuclei -target % -t ~/nuclei-templates/ -nc -s high -c 10 -silent" 2> /dev/null | anew Nuclie/nuclei.txt | notify -silent &> /dev/null
    xargs -a Subdomain/lives.txt -P 50 -I % bash -c "nuclei -target % -t ~/nuclei-templates/ -nc -s critical -c 10 -silent" 2> /dev/null | anew Nuclie/nuclei.txt | notify -silent &> /dev/null
    [ "$J" == "False" ] || cat Nuclie/nuclei.txt | python3 -c "import sys; import json; print (json.dumps({'nuclei_info':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/nuclei.json &> /dev/null
    [ "$S" == "False" ] && cat Nuclie/nuclei.txt
}

VULN_SCAN(){
    echo -e "${RD}        ${ED}" | tr -d '\n' | pv -qL 6; echo -e " STARTING INJECTION VULNERABILITY SCANNING ON ${BL}$D${ED} (${YL}sit back and relax....${ED})" | notify -silent

    crlfuzz -l Subdomain/lives.txt -c 50 -s | anew Vulnerable/crlf.txt | notify -silent &> /dev/null
    [ "$S" == "False" ] && cat Vulnerable/crlf.txt 2> /dev/null
    [ "$J" == "False" ] || cat Vulnerable/crlf.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'vuln_crlf':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/crlf.json &> /dev/null

    cat Web_Crawling/urls.txt | cut -d"?" -f1 | cut -d"=" -f1 | grep -iaE "([^.]+)\.zip$|([^.]+)\.zip\.[0-9]+$|([^.]+)\.zip[0-9]+$|([^.]+)\.zip[a-z][A-Z][0-9]+$|([^.]+)\.zip\.[a-z][A-Z][0-9]+$|([^.]+)\.rar$|([^.]+)\.tar$|([^.]+)\.tar\.gz$|([^.]+)\.tgz$|([^.]+)\.sql$|([^.]+)\.db$|([^.]+)\.sqlite$|([^.]+)\.pgsql\.txt$|([^.]+)\.mysql\.txt$|([^.]+)\.gz$|([^.]+)\.config$|([^.]+)\.log$|([^.]+)\.bak$|([^.]+)\.backup$|([^.]+)\.bkp$|([^.]+)\.crt$|([^.]+)\.dat$|([^.]+)\.eml$|([^.]+)\.java$|([^.]+)\.lst$|([^.]+)\.key$|([^.]+)\.passwd$|([^.]+)\.pl$|([^.]+)\.pwd$|([^.]+)\.mysql-connect$|([^.]+)\.jar$|([^.]+)\.cfg$|([^.]+)\.dir$|([^.]+)\.orig$|([^.]+)\.bz2$|([^.]+)\.old$|([^.]+)\.vbs$|([^.]+)\.img$|([^.]+)\.inf$|([^.]+)\.sh$|([^.]+)\.py$|([^.]+)\.vbproj$|([^.]+)\.mysql-pconnect$|([^.]+)\.war$|([^.]+)\.go$|([^.]+)\.psql$|([^.]+)\.sql\.gz$|([^.]+)\.vb$|([^.]+)\.webinfo$|([^.]+)\.jnlp$|([^.]+)\.cgi$|([^.]+)\.tmp$|([^.]+)\.ini$|([^.]+)\.webproj$|([^.]+)\.xsql$|([^.]+)\.raw$|([^.]+)\.inc$|([^.]+)\.lck$|([^.]+)\.nz$|([^.]+)\.rc$|([^.]+)\.html\.gz$|([^.]+)\.gz$|([^.]+)\.env$|([^.]+)\.yml$" | httpx -silent -follow-host-redirects | anew -q Vulnerable/files.txt &> /dev/null
    [ "$J" == "False" ] || cat Vulnerable/files.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'sensitive':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/files.json &> /dev/null

    xargs -a GF/xss.txt -P 50 -I % bash -c "curl -s -L -H \"X-Bugbounty: Testing\" -H \"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36\" --insecure '%' | grep \"<svg/onload=confirm(document.domain)>\" && echo -e \"[POTENTIAL XSS] - % \n \"" 2> /dev/null | grep "POTENTIAL XSS" | anew Vulnerable/xss.txt | notify -silent &> /dev/null
    [ "$S" == "False" ] && cat Vulnerable/xss.txt 2> /dev/null
    [ "$J" == "False" ] || cat Vulnerable/xss.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'vuln_xss':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/xss.json &> /dev/null

    xargs -a GF/ssrf.txt -P 50 -I % bash -c "curl -ks -H \"X-Bugbounty: Testing\" -H \"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36\" --insecure '%' | grep \"compute.internal\" && echo -e \"[POTENTIAL SSRF] - % \n \"" 2> /dev/null | grep "POTENTIAL SSRF" | anew Vulnerable/ssrf.txt | notify -silent &> /dev/null
    [ "$S" == "False" ] && cat Vulnerable/ssrf.txt 2> /dev/null
    [ "$J" == "False" ] || cat Vulnerable/ssrf.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'vuln_ssrf':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/ssrf.json &> /dev/null

    xargs -a GF/redirect.txt -P 50 -I % bash -c "curl -s -iL -H \"X-Bugbounty: Testing\" -H \"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36\" --insecure '%' | grep \"Evil.Com - We get it...Daily\" && echo -e \"[POTENTIAL REDIRECT] - % \n \"" 2> /dev/null | grep "POTENTIAL REDIRECT" | anew Vulnerable/redirect.txt | notify -silent &> /dev/null
    [ "$S" == "False" ] && cat Vulnerable/redirect.txt 2> /dev/null
    [ "$J" == "False" ] || cat Vulnerable/redirect.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'vuln_redirect':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/redirect.json &> /dev/null

    timeout 50m xargs -a GF/sqli.txt -P 50 -I % bash -c "echo % | Jeeves --payload-time 5" | grep "Vulnerable To" | anew Vulnerable/sqli.txt | notify -silent 2> /dev/null &> /dev/null
    [ "$S" == "False" ] && cat Vulnerable/sqli.txt 2> /dev/null
    [ "$J" == "False" ] || cat Vulnerable/sqli.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'vuln_redirect':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/redirect.json &> /dev/null

    dalfox file .tmp/xssp.txt --silence --no-color --waf-evasion --no-spinner --mass --mass-worker 100 --skip-bav -w 100 -H "X-Bugbounty: Testing" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36" 2> /dev/null | anew Vulnerable/dalfoxss.txt | notify -silent &> /dev/null
    [ "$S" == "False" ] && cat Vulnerable/dalfoxss.txt 2> /dev/null
    [ "$J" == "False" ] || cat Vulnerable/dalfoxss.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'dalfox':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/dalfox.json &> /dev/null

    [ "$J" == "False" ] || cat .json/*.json | jq -s 'add' 2> /dev/null | tee output.json &> /dev/null
}


#>>>>DIRECTORY ENUMERATION
CONTENT_ENUM(){
    echo -e "${RD}        ${ED}" | tr -d '\n' | pv -qL 6; echo -e " STARTING DIRECTORY FUZZING ON ${BL}$D${ED} (${YL}sit back and relax....${ED})" | notify -silent
    for target in $(cat Subdomain/lives.txt); do
        fuzzout=$(echo $target | awk -F// '{print $NF}' | sed -E 's/[\.|:]+/_/g')
        ffuf -u $target/FUZZ -ac -t 100 -mc 200 -sf -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36" -w ~/wordlists/fuzz.txt -p '0.6-1.2' -e .html,.json,.php,.asp,.aspx,.log,.sql,.txt,.asp,.jsp,.bak,~,.db -maxtime 900 -o Directories/$fuzzout.json -s 2> /dev/null &> /dev/null
        cat Directories/$fuzzout.json | jq -r '.results[] | .status, .length, .url' 2> /dev/null | xargs -n3 | anew -q Directories/$fuzzout.txt
        rm -rf Directories/$fuzzout.json
    done
}


#>>>>FINAL MESSAGE
SEND_NOTE(){
    echo -e ""
    echo -e "${YL} -:SCANNING COMPLETED SUCCESSFULLY ON:- \e[31m$D\e[0m ${ED}"
    echo -e "${RD}[WebGuardian]${ED} - Scanning completed on $D at $(date)" | notify -silent
}


VAULT(){
    SUBDOMAIN_SCAN 2> /dev/null
    WEB_ENUM 2> /dev/null
    NUCLIE_SCAN 2> /dev/null
    VULN_SCAN 2> /dev/null
    CONTENT_ENUM 2> /dev/null
    SEND_NOTE 2> /dev/null
}


while true
do
    INFOM
    MAKDR
    VAULT
    exit
done