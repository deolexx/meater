<#macro login path isRegisterForm>



    <form action="${path}" method="post">
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label" for="InputName"> User Name : </label>
            <div class="col-sm-4">
                <input type="text" id="InputName" class="form-control" name="username" placeholder="User name"/>
            </div>
        </div>
        <div class="row mb-3"><label class="col-sm-2 col-form-label" for="InputPassword"> Password: </label>
            <div class="col-sm-4">
                <input class="form-control" type="password"
                       id="InputPassword"
                       name="password" placeholder="Password"/>
                <div id="emailHelp" class="form-text ">We'll never share your password with anyone else.</div>
            </div>

        </div>
    <#if isRegisterForm>
        <div class="row mb-3"><label class="col-sm-2 col-form-label" for="InputEmail"> Email: </label>
            <div class="col-sm-4">
                <input class="form-control" type="email"
                       id="InputEmail"
                       name="email" placeholder="google@com"/>
                <div id="emailHelp" class="form-text "></div>
            </div>
        </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm><a href="/registration">Add new User</a></#if>

        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sigh In</#if></button>
    </form>
</#macro>


<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Sign Out</button>
    </form>
</#macro>