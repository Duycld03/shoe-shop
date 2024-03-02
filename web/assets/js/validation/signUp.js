function validForm() {
    let password = document.querySelector("#password").value
    let confirmPassword = document.querySelector("#confirmPassword").value

    if (password !== confirmPassword) {
        message("warning", "Confirm Password incorrect")
        return false
    }
    return true
}
