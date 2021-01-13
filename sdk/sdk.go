package main

import (
	"C"

	stcore "github.com/yoooov/shadowtunnel/core"
)

//export Start
func Start(serviceArgsStr *C.char) (errStr *C.char) {
	return C.CString(C.GoString(serviceArgsStr))
}

//export Stop
func Stop(serviceID *C.char) {
	stcore.Stop()
}

func main() {
}
