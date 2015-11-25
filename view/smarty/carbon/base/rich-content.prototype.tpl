{function name="richContentItems" items=null}
    {if $items}
        {foreach $items->data as $item}
            {$function = "richContent`$item->type|ucwords`"}
            {call $function data=$item->data}
        {/foreach}
    {/if}
{/function}

{function name="richContentHeading" data=null}
    {$data|k}
{/function}
{function name="richContentQuote" data=null}
    {$data|k}
{/function}
{function name="richContentText" data=null}
    {$data|k}
{/function}
{function name="richContentList" data=null}
    {$data|k}
{/function}

