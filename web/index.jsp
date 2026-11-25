<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.concurrent.atomic.AtomicInteger" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>
<%@ page import="models.LostItem" %>
<%
    String contextPath = request.getContextPath();

    AtomicInteger counter = (AtomicInteger) application.getAttribute("visitorCounter");
    int visitorCount = 0;
    if (counter != null) {
        visitorCount = counter.incrementAndGet();
    }

    int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
    String greeting = "Welcome";
    if (hour < 12) {
        greeting = "Good Morning";
    } else if (hour < 18) {
        greeting = "Good Afternoon";
    } else {
        greeting = "Good Evening";
    }

    @SuppressWarnings("unchecked")
    List<LostItem> items = (List<LostItem>) application.getAttribute("itemsList");
%>
<jsp:include page="/WEB-INF/includes/header.jsp" />

<section class="hero-banner">
    <h2><%= greeting %>, Tigers!</h2>
    <p>Centralized custody registry for misplaced valuables, IDs, electronics, and school items across campus grounds.</p>
    <div class="visitor-pill">
        <span>Campus Visitors:</span>
        <span class="visitor-count"><%= visitorCount %></span>
    </div>
</section>

<div class="grid-2">
    <div class="card">
        <div class="card-title">
            <span>Found a Lost Property?</span>
            <span class="badge badge-green">Surrender</span>
        </div>
        <p style="color: var(--cocoa-muted); margin-bottom: 1.25rem; font-size: 0.92rem;">
            Turn over surrendered student valuables to official campus custody lockers so claimants can recover them safely.
        </p>
        <a href="<%= contextPath %>/report-item.jsp" class="btn btn-success">Report Found Item &rarr;</a>
    </div>

    <div class="card">
        <div class="card-title">
            <span>Searching for Misplaced Property?</span>
            <span class="badge badge-blue">Claim</span>
        </div>
        <p style="color: var(--cocoa-muted); margin-bottom: 1.25rem; font-size: 0.92rem;">
            Authenticate with your student or campus personnel account to file claims, view locker locations, or manage records.
        </p>
        <a href="<%= contextPath %>/login.jsp" class="btn btn-primary">Sign In to Claim &rarr;</a>
    </div>
</div>

<div class="card" style="margin-bottom: 0;">
    <div class="card-title">
        <span>Recent Campus Custody Ledger</span>
        <span class="badge badge-blue">Public Feed</span>
    </div>
    <div class="table-responsive">
        <table class="data-table">
            <thead>
                <tr>
                    <th>Item ID</th>
                    <th>Item Description</th>
                    <th>Category</th>
                    <th>Found Location</th>
                    <th>Custody Locker</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (items != null && !items.isEmpty()) {
                        for (LostItem item : items) {
                            String badgeClass = "badge-yellow";
                            if ("Claimed".equalsIgnoreCase(item.getStatus())) {
                                badgeClass = "badge-green";
                            } else if ("Surrendered".equalsIgnoreCase(item.getStatus())) {
                                badgeClass = "badge-blue";
                            } else if ("Disposed".equalsIgnoreCase(item.getStatus())) {
                                badgeClass = "badge-red";
                            }
                %>
                <tr>
                    <td><strong><%= item.getId() %></strong></td>
                    <td><%= item.getItemName() %></td>
                    <td><%= item.getCategory() %></td>
                    <td><%= item.getLocationFound() %></td>
                    <td><%= item.getLockerStation() %></td>
                    <td><span class="badge <%= badgeClass %>"><%= item.getStatus() %></span></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td><strong>#LF-104</strong></td>
                    <td>Casio Scientific Calculator fx-991EX</td>
                    <td>Stationery</td>
                    <td>Albertus Magnus Bldg Rm 302</td>
                    <td>Locker A-01 (Security Office)</td>
                    <td><span class="badge badge-blue">Surrendered</span></td>
                </tr>
                <tr>
                    <td><strong>#LF-103</strong></td>
                    <td>AquaFlask 32oz Marine Blue</td>
                    <td>Tumblers</td>
                    <td>Central Library 2nd Floor</td>
                    <td>Locker B-03 (Building Lobby)</td>
                    <td><span class="badge badge-yellow">Claim Pending</span></td>
                </tr>
                <tr>
                    <td><strong>#LF-102</strong></td>
                    <td>UST Student ID &amp; Beep Card</td>
                    <td>Identification</td>
                    <td>Main Building Quadrangle</td>
                    <td>Locker A-02 (Central Desk)</td>
                    <td><span class="badge badge-green">Claimed</span></td>
                </tr>
                <tr>
                    <td><strong>#LF-101</strong></td>
                    <td>Sony WH-1000XM4 Headphone Case</td>
                    <td>Electronics</td>
                    <td>Q-Pavilion Bleachers</td>
                    <td>Locker C-04 (Admin Vault)</td>
                    <td><span class="badge badge-red">Unclaimed</span></td>
                </tr>
                <%  } %>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="/WEB-INF/includes/footer.jsp" />
