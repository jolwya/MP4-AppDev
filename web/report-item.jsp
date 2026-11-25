<%-- 
    Document   : report-item
    Created on : 11 22, 26, 9:06:15 PM
    Author     : caitlinjuliaamparo
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%
    String contextPath = request.getContextPath();
    User currentUser = (User) session.getAttribute("currentUser");
%>
<jsp:include page="/WEB-INF/includes/header.jsp" />

<div class="card" style="max-width: 820px; margin: 0 auto;">
    <div class="card-title">
        <span>Surrender / Report Lost Item</span>
        <span class="badge badge-green">Custody Form</span>
    </div>

    <% if (request.getParameter("error") != null) { %>
        <div class="alert alert-danger">
            Please fill in all mandatory fields marked with an asterisk (*).
        </div>
    <% } %>

    <% if (request.getParameter("success") != null) { %>
        <div class="alert alert-success">
            Item custody record logged successfully! The item has been placed in verification queue.
        </div>
    <% } %>

    <form action="<%= contextPath %>/item" method="POST">
        <input type="hidden" name="action" value="reportItem">

        <div class="grid-2">
            <div class="form-group">
                <label for="itemName">Item Name / Title *</label>
                <input type="text" id="itemName" name="itemName" class="form-control" placeholder="e.g., Casio fx-991EX, Hydro Flask 32oz, UST ID" required>
            </div>

            <div class="form-group">
                <label for="category">Category *</label>
                <select id="category" name="category" class="form-control" required>
                    <option value="Electronics">Electronics &amp; Gadgets</option>
                    <option value="Identification">IDs, Cards &amp; Wallets</option>
                    <option value="Tumblers">Tumblers &amp; Water Bottles</option>
                    <option value="Stationery">Books, Calculators &amp; Notes</option>
                    <option value="Personal">Keys, Bags &amp; Accessories</option>
                    <option value="Other">Other Miscellaneous</option>
                </select>
            </div>
        </div>

        <div class="grid-2">
            <div class="form-group">
                <label for="locationFound">Location Found / Surrendered *</label>
                <select id="locationFound" name="locationFound" class="form-control" required>
                    <option value="Central Library">Central Library</option>
                    <option value="Main Building">Main Building</option>
                    <option value="Roque Ruano Bldg">Roque Ruaño Building (Engineering)</option>
                    <option value="Albertus Magnus Bldg">Albertus Magnus Building (Education)</option>
                    <option value="St. Raymund Bldg">St. Raymund de Peñafort (AB / Commerce)</option>
                    <option value="Q-Pavilion">Quadricentennial Pavilion</option>
                    <option value="Botanical Garden">Botanical Garden / Plaza Mayor</option>
                </select>
            </div>

            <div class="form-group">
                <label for="lockerStation">Assigned Custody Locker / Station *</label>
                <select id="lockerStation" name="lockerStation" class="form-control" required>
                    <option value="Locker A-01 (Security Office)">Locker A-01 (Security Office)</option>
                    <option value="Locker A-02 (Central Desk)">Locker A-02 (Central Desk)</option>
                    <option value="Locker B-03 (Building Lobby)">Locker B-03 (Building Lobby)</option>
                    <option value="Locker C-04 (Admin Vault)">Locker C-04 (Admin Vault)</option>
                </select>
            </div>
        </div>

        <div class="grid-2">
            <div class="form-group">
                <label for="finderName">Surrendered By (Full Name) *</label>
                <input type="text" id="finderName" name="finderName" class="form-control" 
                       value="<%= (currentUser != null) ? currentUser.getFullName() : "" %>" 
                       placeholder="e.g., Juan Dela Cruz" required>
            </div>

            <div class="form-group">
                <label for="contactInfo">Contact Number / Email *</label>
                <input type="text" id="contactInfo" name="contactInfo" class="form-control" placeholder="e.g., 0917-000-0000 or email@ust.edu.ph" required>
            </div>
        </div>

        <div class="form-group">
            <label for="description">Item Description &amp; Distinct Marks</label>
            <input type="text" id="description" name="description" class="form-control" placeholder="e.g., Black pouch, green Snoopy sticker on lid, minor scratch on corner">
        </div>

        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 1.5rem; flex-wrap: wrap; gap: 0.75rem;">
            <a href="index.jsp" class="btn btn-secondary">&larr; Return to Public Feed</a>
            <button type="submit" class="btn btn-success">Submit Custody Record &rarr;</button>
        </div>
    </form>
</div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />