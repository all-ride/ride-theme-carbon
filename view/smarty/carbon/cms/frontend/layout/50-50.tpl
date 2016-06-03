{include 'cms/helper/layout'}

{function layout_50_50 section=null widgets=null}

    {$blocks = []}
    {$blocks['1'] = 'grid__12 grid--bp-med__6'}
    {$blocks['2'] = 'grid__12 grid--bp-med__6'}

    {call renderLayout blocks=$blocks}

{/function}
