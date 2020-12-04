<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/2/2020
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pageTitle" scope="request" value="${product.name}"/>
<jsp:include page="/common/web/header.jsp"></jsp:include>
<div class="container" style="padding-top: 180px;">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
            <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/products">Sản phẩm</a></li>
        </ol>
    </nav>
    <div class="row mb-2">
        <div class="col-md-6 col-sm-12 position-relative">
            <span class="badge badge-danger position-absolute">-${product.getDiscount()}%</span>
            <img class="img-fluid" src="<c:url value="${product.getImg()}"/>" alt="Loading">
        </div>
        <div class="col-md-6 col-sm-12">
            <h1><c:out value="${product.name}"/></h1>
            <p>Price: <span class="font-weight-bold text-danger">${product.price}</span></p>
            <p>Realprice: <span style="text-decoration-line: line-through">${requestScope.product.getRealPrice()}</span>
            </p>
            <p>Mô tả: ${product.getDescription()}</p>
            <button class="btn btn-primary" onclick="addToCart(${product.getId()})"><i class="fas fa-shopping-cart"></i>
                Thêm vào giỏ hàng
            </button>
        </div>
        <div class="col">
            <h3><c:out value="${product.name}"/></h3>
            <br>
            <hr>
            <div class="price">
                Price: ${product.price}
            </div>
            <hr>
            <div style="color: red; font-weight: bolder">
                Realprice: ${requestScope.product.getRealPrice()}
            </div>
            <hr>
            <div>Mô tả : ${product.getDescription()}</div>
            <hr>
<%--            <form action="/cart?action=add&id=${product.getId()}&page=productDetail">--%>
<%--                <input type="hidden" name="action" value="add">--%>
<%--                <input type="hidden" name="action" value="add">--%>
            <button class="btn btn-primary" onclick="loadDoc(${product.getId()})"
                    style="color: #c6c8ca; font-size: larger">Them vao gio hang</i>
            </button>

            <hr>
        </div>
    </div>
    <br>
    <div>Các sản phẩm tương tự :</div>
    <hr>
    <div class="row">
        <c:forEach var="product" items="${products}">
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card h-100 cardBorder">
                    <div class="discount">
                        <p>- ${product1.getDiscount()}% </p>
                    </div>
                    <a href="/products?action=view&id=${product.getId()}"><img class="card-img-top" src="<c:url value="${product.getImg()}"/>" height="200" alt="loading"></a>
                    <div class="card-body cardBody">
                        <h4 class="card-title">
                            <a href="/products?action=view&id=${product.getId()}">${product.getName()}</a>
                        </h4>
                        <h5 class="realPrice">$ ${product.getRealPrice()}</h5>
                        <h5 class="price">$${product.getPrice()}</h5>
                        <p class="card-text"> ${product.getDescription()}</p>
                    </div>
                    <div class="card-footer ml-auto">
                        <button class="btn btn-warning" onclick="loadDoc(${product.getId()})"
                                style="color: #c6c8ca; font-size: larger"><i class="fas fa-shopping-cart"></i>
                        </button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!-- /.container -->
<%@include file="/common/web/footer.jsp" %>