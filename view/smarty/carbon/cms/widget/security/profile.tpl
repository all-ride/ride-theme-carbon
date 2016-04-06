{* widget: profile; action: index; translation: widget.profile *}

{include 'base/form.prototype'}

<div class="block" id="widget-{$app.cms.widget}">
    <form id="{$form->getId()}" class="form" action="{$app.url.request}" method="POST" enctype="multipart/form-data" role="form">
        <div class="form__group">
            <div class="tabbable">
            <ul class="tabs">
            {foreach $hooks as $hookName => $hook}
                <li class="tabs__tab {if $activeHook == $hookName} active{/if}">
                    <a href="#hook-{$hookName}" data-toggle="tab">{"profile.hook.$hookName"|translate}</a>
                </li>
            {/foreach}
            {if $form->hasRow('submit-unregister')}
                <li class="tabs__tab">
                    <a href="#hook-unregister" data-toggle="tab">{'button.unregister'|translate}</a>
                </li> 
            {/if}
            </ul>

            <div class="tabs__content">
            {foreach $hooks as $hookName => $hook}
                <div id="hook-{$hookName}" class="tabs__pane{if $activeHook == $hookName} active{/if}">
                    {$hookViews.$hookName}
                </div>
            {/foreach}
            {if $form->hasRow('submit-unregister')}
                <div id="hook-unregister" class="tabs__pane{if $activeHook == 'unregister'} active{/if}">
                    <p>{'label.unregister'|translate}</p>

                    {call formRow form=$form row="submit-unregister"}
                </div>
            {/if}
            </div>
        </div>
    </form>
</div>
