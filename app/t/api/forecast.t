use v5.14;

use Test::More;
use Core::Utils qw/shm_test_api/;

my %ret = shm_test_api(
    login => 'danuk',
    password => 'danuk',
    url => '/v1/template/forecast?format=default',
    method => 'GET',
);

is %ret{json}->{data}->[0], 'Уважаемый Фирсов Даниил Андреевич

Уведомляем Вас о сроках действия услуг:

- Услуга: Тариф X-MAX (10000 мб)
  Стоимость: 123.45 руб.
  Истекает: 2017-01-31 23:59:50
- Услуга: Продление домена в зоне .RU: umci.ru
  Стоимость: 890 руб.
  Истекает: 2017-07-29 12:39:46

Погашение задолженности: 21.56 руб.

Итого к оплате: 1035.01 руб.

Услуги, которые не будут оплачены до срока их истечения, будут приостановлены.

Подробную информацию по Вашим услугам Вы можете посмотреть в вашем личном кабинете: http://127.0.0.1:8081

Это письмо сформировано автоматически. Если оно попало к Вам по ошибке,
пожалуйста, сообщите об этом нам: mail@domain.ru'
, 'Check tempate forecast';

done_testing();

exit 0;

