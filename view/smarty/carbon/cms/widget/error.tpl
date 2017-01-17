<div class="notice notice--error" role="alert">
    <button type="button" class="btn btn--close" data-dismiss="alert">
        <span aria-hidden="true">×</span><span class="visuallyhidden">Close</span>
    </button>
    <h3>{$widgetName}#{$widgetId}</h3>
    {foreach $exceptionArray as $exception}
        <p><strong>{$exception.type}{if $exception.message}: {$exception.message}{/if}</strong></p>
        <small><pre>{$exception.trace}</pre></small>
        {if !$exception@last}
        <p>Causes</p>
        {/if}
    {/foreach}
</div>
