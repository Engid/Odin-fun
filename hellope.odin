package hellope

import "core:fmt"
import "core:os" 
import "core:strconv"
import "core:strings"

main :: proc() {
    buf: [256]byte 
    fmt.println("A: ")
    n, err := os.read(os.stdin, buf[:])
    if err != nil {
        fmt.eprintln("Error reading A: ", err)
        return 
    }

    a_str := strings.trim_space(string(buf[:n]))

    a, ok := strconv.parse_int(a_str)

    if !ok {
        fmt.eprintln("Error parsing A")
    }

    fmt.println(a, ok)

    fmt.println("B: ")

    n, err = os.read(os.stdin, buf[:])

    if err != nil {
        fmt.eprintln("Error reading B: ", err)
        return 
    }

    b_str := strings.trim_space(string(buf[:n]))

    b, ok_b := strconv.parse_int(b_str)

    if !ok_b {
        fmt.eprintln("Error parsing B")
    }

    fmt.println("sum: ", a + b)
}

