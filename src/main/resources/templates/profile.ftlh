<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>${username}</h5>
    ${message!}

    <form method="post">

        <div class="row mb-3"><label class="col-sm-2 col-form-label" for="InputPassword"> Password: </label>
            <div class="col-sm-4">
                <input class="form-control" type="password"
                       id="InputPassword"
                       name="password" placeholder="Password"/>
                <div id="emailHelp" class="form-text ">We'll never share your password with anyone else.</div>
            </div>

        </div>

            <div class="row mb-3"><label class="col-sm-2 col-form-label" for="InputEmail"> Email: </label>
                <div class="col-sm-4">
                    <input class="form-control" type="email"
                           id="InputEmail"
                           name="email" placeholder="google@com" value="${email!''}"/>
                </div>
            </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>


        <button class="btn btn-primary" type="submit">Save</button>
    </form>

</@c.page>