import 'package:aprovacao/features/user/signup/signup_injection_container.dart' as sign_up_dependencies;
import 'package:aprovacao/features/user/signin/signin_injection_container.dart' as sign_in_dependencies;
import 'package:aprovacao/features/user/signout/signout_injection_container.dart' as sign_out_dependencies;
import 'package:aprovacao/features/certifications/list/certifications_injection_container.dart' as certification_dependencies;
import 'package:aprovacao/features/modules/list/modules_injection_container.dart' as module_dependencies;
import 'package:aprovacao/features/questions/manager/questions_injection_container.dart' as questions_dependencies;
import 'package:aprovacao/features/questions/feedback/feedback_injection_container.dart' as feedback_dependencies;
import 'package:aprovacao/features/report/groups/report_injection_container.dart' as report_dependencies;
import 'package:aprovacao/features/reset/reset_injection_container.dart' as reset_dependencies;

class DependencyInjector {
  static void initDependencies() {
    sign_in_dependencies.init();
    sign_up_dependencies.init();
    sign_out_dependencies.init();
    certification_dependencies.init();
    module_dependencies.init();
    questions_dependencies.init();
    feedback_dependencies.init();
    report_dependencies.init();
    reset_dependencies.init();
  }
}
