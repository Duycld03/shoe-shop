<%-- Document : updateVariant Created on : Mar 6, 2024, 11:01:00 PM Author : Doan Thanh Phuc - CE170580 --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
        <script src="/assets/js/validation/jquery.min.js"></script>
        <script src="/assets/js/validation//manager.js" type="text/javascript"></script>
        <script src="/assets/js/validation/bootstrap.min.js"></script>
        <script src="/assets/js/script.js"></script>
    </head>

    <body>
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <c:set var="c" value="${requestScope.var}" />
                    <form action="/updatevariant" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Update Product Variant</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group d-none">
                                <label>ProID</label>
                                <input name="proid" type="text" class="form-control" value="${c.productId}"
                                       required>
                            </div>
                            <div class="form-group d-none">
                                <label>VariantID</label>
                                <input name="varid" type="text" class="form-control" value="${c.variantId}"
                                       required>
                            </div>
                            <div class="form-group">
                                <label>Color</label>
                                <input name="color" type="text" readonly class="form-control" value="${c.color}"
                                       required>
                                <div class="text-danger">${error}</div>
                            </div>
                            <div class="form-group">
                                <label>Size</label>
                                <input name="size" min="1" type="number" readonly class="form-control"
                                       value="${c.size}" required title="size must contain 10 digits">
                                <div class="text-danger">${error}</div>
                            </div>
                            <div class="form-group">
                                <label>Stock Quantity</label>
                                <input name="stockquantity" min="0" type="number" class="form-control"
                                       value="${c.stockQuantity}" required
                                       title="Discount number must contain 10 digits">
                            </div>
                            <div class="form-group">
                                <label>Is Delete</label>
                                <select name="isdelete" class="form-control">
                                    <option value="true" ${c.isDelete()=='true' ? 'selected' : '' }>true
                                    </option>
                                    <option value="false" ${c.isDelete()=='false' ? 'selected' : '' }>false
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <input type="submit" name="btnSave" class="btn btn-success" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var editEmployeeModal = document.getElementById("editEmployeeModal");
                var closeModalButtons = document.querySelectorAll("#editEmployeeModal button.close, #editEmployeeModal button[data-dismiss='modal']");

                closeModalButtons.forEach(function (button) {
                    button.addEventListener("click", function () {
                        // Đóng modal khi nút "X" hoặc "Cancel" được nhấn
                        $("#editEmployeeModal").modal("hide");
                        // Chuyển hướng về trang staffmanager
                        window.location.href = "/productDetailInfor?proID=${c.productId}";
                    });
                });

                $('#editEmployeeModal').on('hidden.bs.modal', function () {
                    // Chuyển hướng đến trang mong muốn sau khi modal được đóng
                    window.location.href = "productmanagement";
                });

                // Hiển thị modal
                $('#editEmployeeModal').modal('show');
            });

        </script>
    </body>

</html>