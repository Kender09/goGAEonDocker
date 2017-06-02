package app

import (
	"log"
	"net/http"
)

func init() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		log.Println(r)
		w.Write([]byte("OK"))
	})
}
