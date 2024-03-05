function redirectToDetailPage(productId) {
    window.location.href = '/product?proID=' + productId;
}

function message(status, title, text, callback) {
    Swal.fire({
        title: title,
        text: text,
        icon: status
    }).then(callback);
}
function messageConfirm(text, callback) {
    Swal.fire({
        title: "Are you sure?",
        text: text,
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes"
    }).then((result) => {
        if (result.isConfirmed) {
           callback();
        }
    });
}