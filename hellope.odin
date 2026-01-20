package hellope

import "core:fmt"
import "core:os" 
import "core:strconv"
import "core:strings"

main :: proc() {
    buf: [256]byte 

    a, ok_a := read_int("A: ", buf[:])

    if !ok_a {
        fmt.eprintln("Error parsing A")
    }

    b, ok_b := read_int("B: ", buf[:])
    if !ok_b {
        fmt.eprintln("Error parsing B")
    }

    fmt.println("sum:", a + b)
}


read_int :: proc(prompt: string, buf: []byte) -> (int, bool) {
    fmt.print(prompt)
    n, err := os.read(os.stdin, buf[:])
    if err != nil {
        fmt.eprintln("Error reading input: ", err)
        return 0, false
    }

    s := strings.trim_space(string(buf[:n]))
    v, ok := strconv.parse_int(s)
   
    return v, ok
}
