<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<@c.page>
            <div>
            <form class="row g-2 mb-3" method="get" action="/main" >

                <div class="col-auto"><input type="text" name="filter" class="form-control" value="${filter!}"
                            placeholder="Search by tag"></div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary ml-2">Search</button>
                </div>
            </form>
            </div>

    <a class="btn btn-primary mb-3" data-bs-toggle="collapse" href="#collapseForm" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>
<div class="collapse <#if message??>show</#if>" id="collapseForm">
    <div class="input-group mb-3">
        <form method="post" enctype="multipart/form-data">
            <!--Message input field-->
            <input type="text" class="form-control ${(textError??)?string('is-invalid','')}  mb-2"
                   value="<#if message??>${message.text}</#if>" name="text" placeholder="Введите сообщение"/>
            <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
</div>

            </#if>
            <!--Tag input field-->
            <input type="text" class="form-control mb-2"
                   value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг">
            <#if textError??>
                <div class="invalid-feedback">
                    ${tagError}
                </div>
            </#if>
            <!--File input field-->
            <div class="input-group mb-2">
                <input type="file" name="file" class="form-control" id="inputGroupFile04"  aria-label="Upload">
            </div>
            <!--security token field-->
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class=" btn btn-primary " type="submit">Добавить</button>
        </form>
    </div>
</div>

<div class="row row-cols-1 row-cols-md-4 g-4">

<#list messages as message>
    <div class="col mb-4">
    <div class="card h-100">
        <div>
            <#if  message.filename??>
                <img src="/img/${message.filename}" class="card-img-top" alt="">
            </#if>
        </div>
        <div class="card-body">

                <div class=" font-monospace text-muted">
                    <ul class="list-inline">
                        <li class="list-inline-item ">#Tag:</li>
                        <li class="list-inline-item">${message.tag}</li>
                    </ul>

                </div>
            <div>${message.text}</div>

        </div>
        <div class="card-footer">

            <small class="text-muted">${message.authorName}</small>

            <small class="text-muted">${message.getDate()!}</small>
            <#if message.authorName=name>
            <form action="/delete" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="hidden" name="messageId" value="${message.id}">
                <button class="btn btn-secondary btn-sm" type="submit" onclick="if (!confirm('Delete this message?')) { return false }">Delete</button>
            </form>
            </#if>
        </div>


    </div>
    </div>
<#else>
    <div class="alert alert-danger" role="alert">
    No messages to show
        </div>

</#list>

</div>
</@c.page>