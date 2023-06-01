library common;

//DATASOURCES
export 'datasources/api/api_datasource.dart';
export 'datasources/api/dio/dio_api_datasource_imp.dart';
export 'datasources/databases/app_database/app_repository.dart';
export 'datasources/databases/app_database/shared_preferences/app_repository_shared_imp.dart';
export 'datasources/auth/firebase/firabase_auth_datasource_imp.dart';
export 'datasources/errors/repository_error.dart';
export 'datasources/auth/auth.dart';

//DOMAIN
export 'domain/usecases/google_auth/google_auth_usecase.dart';
export 'domain/usecases/google_auth/google_auth_usecase_imp.dart';
export 'domain/usecases/logout/logout_usecase.dart';
export 'domain/usecases/logout/logout_usecase_imp.dart';
export 'domain/usecases/email_auth/email_auth.dart';
export 'domain/usecases/email_auth/email_auth_imp.dart';
export 'domain/entities/user.dart';
export 'domain/errors/generic_error.dart';

//INFRA
export 'infra/services/show_error_services.dart';
export 'infra/services/show_modal_bottom_sheet_services.dart';
export 'infra/dtos/login_dto.dart';

//UTILS
export 'utils/tuple.dart';
export 'designs/app_colors.dart';
export 'designs/app_fonts.dart';
export 'injector.dart';
export 'designs/app_assets.dart';
export 'envoriment_variables.dart';
export 'utils/mocks/mock_navigator_observer.dart';
export 'utils/app_routes.dart';
export 'utils/value_objects/email.dart';
export 'utils/value_objects/password.dart';
export 'utils/form_validations.dart';

//WIDGETS
export 'presenters/widgets/abstract_background.dart';
export 'presenters/widgets/transparent_app_bar_widget.dart';
export 'presenters/widgets/logo_widget.dart';
export 'presenters/widgets/common_input.dart';
export 'presenters/widgets/social_login_button.dart';
export 'presenters/widgets/or_widget.dart';
export 'presenters/widgets/common_button_text.dart';
export 'presenters/widgets/common_text_button.dart';
export 'presenters/modals/get_started_modal_bottom_sheet.dart';
export 'presenters/modals/sign_in_modal_bottom_sheet.dart';

//ANIMATIONS
export 'presenters/animations/moving_animation.dart';

//PAGES
export 'presenters/pages/common_page_structure.dart';
export 'presenters/animations/common_page_animated.dart';

//BLOCS
export 'presenters/blocs/user_bloc/user_bloc.dart';
