import 'package:aprovacao/features/user/signup/signup_injection_container.dart' as sign_up_dependencies;
import 'package:aprovacao/features/user/signin/signin_injection_container.dart' as sign_in_dependencies;
import 'package:aprovacao/features/user/signout/signout_injection_container.dart' as sign_out_dependencies;
import 'package:aprovacao/features/biome/list/biome_injection_container.dart' as biome_dependencies;
import 'package:aprovacao/features/contributions/list/contributions_injection_container.dart' as contribution_dependencies;
import 'package:aprovacao/features/contributions/create/create_contribution_injection_container.dart' as create_contribution_dependencies;

class DependencyInjector {
  static void initDependencies() {
    sign_in_dependencies.init();
    sign_up_dependencies.init();
    sign_out_dependencies.init();
    biome_dependencies.init();
    contribution_dependencies.init();
    create_contribution_dependencies.init();
  }
}
