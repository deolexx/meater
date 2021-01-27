<#macro login path isRegisterForm>

    <form action="${path}" method="post">
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label" for="InputName"> User Name : </label>
            <div class="col-sm-4">
                <input type="text" id="InputName"
                       value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid','')}" name="username" placeholder="User name"/>
            </div>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
        <div class="row mb-3"><label class="col-sm-2 col-form-label" for="InputPassword"> Password: </label>
            <div class="col-sm-4">
                <input class="form-control ${(passwordError??)?string('is-invalid','')}" type="password"
                       id="InputPassword"
                       name="password" placeholder="Password"/>
                <div id="emailHelp" class="form-text ">We'll never share your password with anyone else.</div>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>

        </div>
    <#if isRegisterForm>
        <div class="row mb-3"><label class="col-sm-2 col-form-label" for="InputPassword"> Password: </label>
            <div class="col-sm-4">
                <input class="form-control ${(password2Error??)?string('is-invalid','')}" type="password"
                       id="InputPassword"
                       name="password2" placeholder="Retype password"/>
                <div id="emailHelp" class="form-text ">We'll never share your password with anyone else.</div>
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>

        </div>
        <div class="row mb-3"><label class="col-sm-2 col-form-label" for="InputEmail"> Email: </label>
            <div class="col-sm-4">
                <input class="form-control ${(password2Error??)?string('is-invalid','')}" type="email"
                       id="InputEmail"
                       value="<#if user??>${user.email}</#if>"
                       name="email" placeholder="google@com"/>
            </div>
            <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
            </#if>
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