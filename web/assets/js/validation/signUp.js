function validForm() {
    let password = document.querySelector("#password")
    let confirmPassword = document.querySelector("#confirmPassword")

    if (password !== confirmPassword) {
        alert("Confirm Password incorrect")
        return false
    }
    return true
}
