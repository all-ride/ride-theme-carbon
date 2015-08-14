<?php

function smarty_function_addBodyComponent($params, &$smarty) {
    $app = $smarty->getTemplateVars('app');
    $bodyComponent = $app['cms']['node']->get('body.components');
    if (!strstr($bodyComponent, $params['component'])) {
        $app['cms']['node']->set('body.components', $bodyComponent . ' ' . $params['component']);
    }
}
