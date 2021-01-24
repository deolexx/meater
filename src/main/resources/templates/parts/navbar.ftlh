<#include "security.ftlh">
<#import "login.ftlh" as l>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Meater</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/main">Messages</a>
                </li>
                <#if isAdmin>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/user">UserList</a>
                    </li>
                </#if>
                <#if user??>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/user/profile">Profile</a>
                    </li>
                </#if>
            </ul>

            <#if name!="unknown">
            <span class="navbar-text me-2 ">Hello, ${name}</span>
            <div>
                <@l.logout/>
            </div>
                <#else>
                    <div class="text-muted">
                    You not authorized
                    </div>
            </#if>
        </div>
    </div>
</nav>

<div class="collapse fixed-bottom mb-5" id="navbarToggleExternalContent">
    <div class="bg-dark p-4">
        <h5 class="text-white h4">Created in terms of Java + SpringBoot education by Serhii Lukianenko</h5>
        <span class="text-muted ">(c)2021 Kiev Ukraine</span>
    </div>
</div>
<nav class="navbar fixed-bottom  navbar-dark bg-dark">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>



