import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ptText = '',
  }) =>
      [enText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'awn1ttmh': {
      'en': 'Enter your credentials to access your account.',
      'pt': 'Insira suas credenciais para acessar sua conta.',
    },
    '7coe115q': {
      'en': 'Sign In',
      'pt': 'Entrar',
    },
    'e9pnyzm9': {
      'en': 'Email Address',
      'pt': 'Endereço de email',
    },
    'vuhwdlzn': {
      'en': 'Email Address',
      'pt': 'Endereço de email',
    },
    'z0v8ougp': {
      'en': 'Password',
      'pt': 'Senha',
    },
    '3mg9dzti': {
      'en': 'Password',
      'pt': 'Senha',
    },
    'd7zjcwes': {
      'en': 'Sign In',
      'pt': 'Entrar',
    },
    'hhgceptf': {
      'en': 'Forgot Password?',
      'pt': 'Esqueceu sua senha?',
    },
    'mnrqbvlk': {
      'en': 'Sign Up',
      'pt': 'Inscrever-se',
    },
    'ye7jjwdc': {
      'en': 'Email Address',
      'pt': 'Endereço de email',
    },
    '4u8srye4': {
      'en': '',
      'pt': '',
    },
    'y4q7638d': {
      'en': 'Password',
      'pt': 'Senha',
    },
    '2b9s0vl5': {
      'en': '',
      'pt': '',
    },
    'ffc8ingn': {
      'en': 'Create Account',
      'pt': 'Criar uma conta',
    },
    'tazfclws': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    '64wzffab': {
      'en': 'Email address should be minimum 5 characters',
      'pt': 'O endereço de e-mail deve ter no mínimo 5 caracteres',
    },
    'anmgh4rt': {
      'en': 'email address is too long',
      'pt': 'endereço de e-mail é muito longo',
    },
    'niw2rp7x': {
      'en': 'Email seems to be invalid. Please check',
      'pt': 'O e-mail parece ser inválido. Por favor, verifique',
    },
    '0erhnun6': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'mw32hvo4': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'rklj8lg5': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
  },
  // forgotPassword
  {
    's20e49ou': {
      'en': 'Back',
      'pt': 'Voltar',
    },
    '5slql49v': {
      'en': 'Back',
      'pt': 'Voltar',
    },
    'qgfcbi0c': {
      'en': 'Forgot Password',
      'pt': 'Esqueceu sua senha',
    },
    'fjhybvst': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'pt':
          'Enviaremos um e-mail com um link para redefinir sua senha. Insira o e-mail associado à sua conta abaixo.',
    },
    'ujc5xipx': {
      'en': 'Email Addresss',
      'pt': 'Endereços de e-mail',
    },
    'gegzfze4': {
      'en': 'Enter your email...',
      'pt': 'Insira seu e-mail...',
    },
    '1njh17kf': {
      'en': 'Send Link',
      'pt': 'Enviar Link',
    },
    '9a4bm91z': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // createProfile
  {
    'vyqdl7s3': {
      'en': 'Create Profile',
      'pt': 'Criar Perfil',
    },
    'cnc5fmbk': {
      'en': 'Full Name',
      'pt': 'Nome completo',
    },
    'cjyo6ik7': {
      'en': 'Title or Role',
      'pt': 'Título ou função',
    },
    'h398jj2j': {
      'en': 'Enter description here..',
      'pt': 'Insira a descrição aqui.',
    },
    '7ve36dhv': {
      'en': 'Create & Invite User',
      'pt': 'Criar e convidar usuário',
    },
    'nyguqlya': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    '8opg51gj': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'ht71rkhg': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'bxrlgb5p': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
  },
  // Main_tracker
  {
    '12tkp77z': {
      'en': 'Good morning',
      'pt': 'Bom dia',
    },
    'j0lx26qq': {
      'en': 'Create Task',
      'pt': 'Criar tarefa',
    },
    'qivbgraj': {
      'en': 'My Tasks',
      'pt': 'Minhas tarefas',
    },
    'uwyvo6wk': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'xeqma55c': {
      'en': 'Issue #242952592',
      'pt': 'Edição nº 242952592',
    },
    'jflxt2qx': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    'zi7hfryq': {
      'en': 'Andres Reynolds',
      'pt': 'Andrés Reynolds',
    },
    '8sjmfjjx': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'uiqmsymo': {
      'en': 'Tuesday, 10:00am',
      'pt': 'Terça-feira, 10:00 da manhã',
    },
    'iofpx15n': {
      'en': 'Not Started',
      'pt': 'Não iniciado',
    },
    '832adtr2': {
      'en': 'Start',
      'pt': 'Começar',
    },
    '1460lgka': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'wm00imuu': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    'c8gv1fmj': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'd4gw9qw0': {
      'en': 'Issue #242952592',
      'pt': 'Edição nº 242952592',
    },
    'zdrf3ikg': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    '6p1meot0': {
      'en': 'Andres Reynolds',
      'pt': 'Andrés Reynolds',
    },
    '86lis2jg': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'rd23line': {
      'en': 'Tuesday, 10:00am',
      'pt': 'Terça-feira, 10:00 da manhã',
    },
    'lqbva4ak': {
      'en': 'Complete',
      'pt': 'Completo',
    },
    'hkcnmvtg': {
      'en': 'Complete',
      'pt': 'Completo',
    },
    'htuk5fl0': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'xe34smbh': {
      'en': 'My Tasks',
      'pt': 'Minhas tarefas',
    },
    '1rnio8vt': {
      'en': '(4)',
      'pt': '(4)',
    },
    'oopnhfx6': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'i2oud4oy': {
      'en': 'Issue #242952592',
      'pt': 'Edição nº 242952592',
    },
    '6z27sxtu': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    'kvvayf1a': {
      'en': 'Andres Reynolds',
      'pt': 'Andrés Reynolds',
    },
    'y2umcbi9': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'ut18klg9': {
      'en': 'Tuesday, 10:00am',
      'pt': 'Terça-feira, 10:00 da manhã',
    },
    'rktf6kep': {
      'en': 'Not Started',
      'pt': 'Não iniciado',
    },
    'mpiabjfr': {
      'en': 'Start',
      'pt': 'Começar',
    },
    'i1j0llq5': {
      'en': 'Due',
      'pt': 'Devido',
    },
    '89oepmke': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    'b8974iek': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'vpfyakh9': {
      'en': 'Issue #242952592',
      'pt': 'Edição nº 242952592',
    },
    '2jc6nxa6': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    'z98yqioc': {
      'en': 'Andres Reynolds',
      'pt': 'Andrés Reynolds',
    },
    '6c511ygf': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'z9zv51n7': {
      'en': 'Tuesday, 10:00am',
      'pt': 'Terça-feira, 10:00 da manhã',
    },
    '310ik08p': {
      'en': 'Completed',
      'pt': 'Concluído',
    },
    '6mv3j0ec': {
      'en': 'Tracker',
      'pt': 'Rastreador',
    },
  },
  // createTask_1_SelectProject
  {
    '1evyvanx': {
      'en': 'Create Task',
      'pt': 'Criar tarefa',
    },
    '5p3w7kqb': {
      'en': 'Don\'t see your project? Add one here.',
      'pt': 'Não vê seu projeto? Adicione um aqui.',
    },
    'atun5agk': {
      'en': 'Add Project',
      'pt': 'Adicionar Projeto',
    },
    'nb0qs3fd': {
      'en': 'Last edited:',
      'pt': 'Última edição:',
    },
    'h0y2vck1': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'ry8gdxku': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'xtzbonrg': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'd3cize38': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
  },
  // createTask
  {
    '5maeu8hf': {
      'en': 'Create Task',
      'pt': 'Criar tarefa',
    },
    '1eztr6a4': {
      'en': 'Task Name',
      'pt': 'Nome da tarefa',
    },
    'p0c23doi': {
      'en': 'Enter description here...',
      'pt': 'Insira a descrição aqui...',
    },
    're4r1lkn': {
      'en': 'Not Started',
      'pt': 'Não iniciado',
    },
    'ptyt1h7n': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    'gcvdijqn': {
      'en': 'Complete',
      'pt': 'Completo',
    },
    '9a99unmx': {
      'en': 'Select Status',
      'pt': 'Selecione Status',
    },
    '0pml5dft': {
      'en': 'Create Task',
      'pt': 'Criar tarefa',
    },
    '3nx43hj1': {
      'en': 'Please add a task name.',
      'pt': 'Adicione um nome para a tarefa.',
    },
    'tjxg3net': {
      'en': 'Please enter at least 3 letters.',
      'pt': 'Por favor, insira pelo menos 3 letras.',
    },
    '3khebw6t': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    '45sp2bki': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'cm4f3q0t': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
  },
  // taskDetails
  {
    'hb364kq4': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'q4ikqgkd': {
      'en': 'Team Members',
      'pt': 'Membros da equipe',
    },
    'qrkfqya2': {
      'en': 'Notes & Activity',
      'pt': 'Notas e Atividade',
    },
    '46h6mjof': {
      'en': 'Mark as Complete',
      'pt': 'Marcar como concluído',
    },
    'xvvip759': {
      'en': 'Begin Task',
      'pt': 'Iniciar tarefa',
    },
    'q5i02gt3': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // addTeamMembers
  {
    'dzbojo7r': {
      'en': 'Invite User',
      'pt': 'Convidar usuário',
    },
    '5ilq7vbh': {
      'en': 'Full Name',
      'pt': 'Nome completo',
    },
    '733r7kk8': {
      'en': 'Email',
      'pt': 'E-mail',
    },
    '64z5ta3b': {
      'en': 'Title or Role',
      'pt': 'Título ou função',
    },
    '39qfddvg': {
      'en': 'Team 1',
      'pt': 'Equipe 1',
    },
    '0rrub9lg': {
      'en': 'Team 2',
      'pt': 'Equipe 2',
    },
    '23fglgb8': {
      'en': 'Team 3',
      'pt': 'Equipe 3',
    },
    'd6ul4ero': {
      'en': 'Select Team',
      'pt': 'Selecione a equipe',
    },
    'oehnkpb9': {
      'en': 'Enter description here..',
      'pt': 'Insira a descrição aqui.',
    },
    'c38hkcs1': {
      'en': 'Create & Invite User',
      'pt': 'Criar e convidar usuário',
    },
    '41umybiv': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'i5wagnfq': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'h5euxn0m': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'ag9dglwf': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
  },
  // teamMemberDetails
  {
    'ukmpqe9t': {
      'en': 'Team Name',
      'pt': 'Nome da equipe',
    },
    'rq31lxfx': {
      'en': ' - ',
      'pt': '-',
    },
    '8lhfh12w': {
      'en': '12 Tasks',
      'pt': '12 tarefas',
    },
    'j2ieipip': {
      'en': 'Team Bio',
      'pt': 'Biografia da equipe',
    },
    '9s048496': {
      'en': 'Tasks',
      'pt': 'Tarefas',
    },
    '3rwjcoju': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'znm2flgb': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Main_projectsWeb
  {
    'qcd4z131': {
      'en': 'Projects',
      'pt': 'Projetos',
    },
    '0e5jbrkh': {
      'en': 'A list of your projects below.',
      'pt': 'Uma lista dos seus projetos abaixo.',
    },
    '5mru78lw': {
      'en': 'Create Project',
      'pt': 'Criar Projeto',
    },
    'hmxr55qt': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Main_teamPage
  {
    'vf4ee69k': {
      'en': 'My Team',
      'pt': 'Minha equipe',
    },
    'cqt7v5sb': {
      'en': 'My Team',
      'pt': 'Minha equipe',
    },
    'mop2evm0': {
      'en': 'Search members...',
      'pt': 'Pesquisar membros...',
    },
    '63wkxdr4': {
      'en': 'Find Members',
      'pt': 'Encontrar membros',
    },
    'nyb9lczy': {
      'en': 'Created on',
      'pt': 'Criado em',
    },
    'h2tjjlou': {
      'en': 'My Team',
      'pt': 'Minha equipe',
    },
  },
  // Main_projects
  {
    '3drc3684': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // myProfile
  {
    '5n51xmhd': {
      'en': 'Switch to Dark Mode',
      'pt': 'Mudar para o modo escuro',
    },
    'w3vpe9rl': {
      'en': 'Switch to Light Mode',
      'pt': 'Mudar para o modo claro',
    },
    '05v307ij': {
      'en': 'Account Settings',
      'pt': 'Configurações de Conta',
    },
    'o1pcrlaz': {
      'en': 'Change Password',
      'pt': 'Alterar a senha',
    },
    'alhgf413': {
      'en': 'Edit Profile',
      'pt': 'Editar Perfil',
    },
    'w4vsr6hu': {
      'en': 'Log Out',
      'pt': 'Sair',
    },
    '3e1n01mf': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // createProject
  {
    'zhq7wtzw': {
      'en': 'Create Project',
      'pt': 'Criar Projeto',
    },
    '9duf9kbf': {
      'en': 'Project Name',
      'pt': 'Nome do Projeto',
    },
    'j3scp78v': {
      'en': 'Enter description here...',
      'pt': 'Insira a descrição aqui...',
    },
    'gql7sgl9': {
      'en': 'Create Project',
      'pt': 'Criar Projeto',
    },
    'abj4bb18': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'yyhmrk0i': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'yepouzyh': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'qckve3hq': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
  },
  // projectDetailsPage
  {
    '03c7gtcz': {
      'en': 'View All',
      'pt': 'Ver tudo',
    },
    'vdyl48dm': {
      'en': 'Completed Tasks',
      'pt': 'Tarefas Concluídas',
    },
    'f24x8bkt': {
      'en': 'Number of Tasks',
      'pt': 'Número de tarefas',
    },
    '8i8307mb': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    'mfp5v5yt': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'x63goi6j': {
      'en': 'Issue #242952592',
      'pt': 'Edição nº 242952592',
    },
    '3ihf4pre': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    'frnfsszo': {
      'en': 'Andres Reynolds',
      'pt': 'Andrés Reynolds',
    },
    'sg458n0n': {
      'en': 'Due',
      'pt': 'Devido',
    },
    '6hgcr887': {
      'en': 'Tuesday, 10:00am',
      'pt': 'Terça-feira, 10:00 da manhã',
    },
    '1870f5uq': {
      'en': 'Completed',
      'pt': 'Concluído',
    },
    'xo4dmszc': {
      'en': 'Complete',
      'pt': 'Completo',
    },
    '24rs6kdw': {
      'en': 'Completed on',
      'pt': 'Concluído em',
    },
    '4cmr54lc': {
      'en': 'Activity',
      'pt': 'Atividade',
    },
    'alg6xfua': {
      'en': 'Current Time',
      'pt': 'Hora atual',
    },
    'y1upl145': {
      'en': 'Back',
      'pt': 'Voltar',
    },
    '5kom1132': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // searchMembers
  {
    'i5eebch9': {
      'en': 'Add Members',
      'pt': 'Adicionar membros',
    },
    'bn37syph': {
      'en': 'Search members...',
      'pt': 'Pesquisar membros...',
    },
    'ux02ixql': {
      'en': 'Search Memebers',
      'pt': 'Pesquisar Membros',
    },
    'kmiq19hs': {
      'en': 'Assign',
      'pt': 'Atribuir',
    },
    'ag17xw1c': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // editProfile
  {
    'evdej962': {
      'en': 'Change Photo',
      'pt': 'Alterar foto',
    },
    't7tz85hw': {
      'en': 'Your Name',
      'pt': 'Seu nome',
    },
    'p7ef0qd8': {
      'en': 'Title or Role',
      'pt': 'Título ou função',
    },
    'br3jvobf': {
      'en': 'Your bio',
      'pt': 'Sua biografia',
    },
    '5vmz78yy': {
      'en': 'Email associated with this account:',
      'pt': 'E-mail associado a esta conta:',
    },
    '4cj4t3x4': {
      'en': 'Save Changes',
      'pt': 'Salvar alterações',
    },
    'pt9elxe4': {
      'en': 'Edit Profile',
      'pt': 'Editar Perfil',
    },
  },
  // teamMembers
  {
    'cr7ls6ar': {
      'en': 'Add Members',
      'pt': 'Adicionar membros',
    },
    'gxfshi24': {
      'en': 'Members in Project',
      'pt': 'Membros do Projeto',
    },
    'prexm7ph': {
      'en': 'Remove',
      'pt': 'Remover',
    },
    'gjanmvum': {
      'en': 'UserName',
      'pt': 'Nome de usuário',
    },
    '8dw4hlie': {
      'en': 'Remove',
      'pt': 'Remover',
    },
    'eq219wh6': {
      'en': 'UserName',
      'pt': 'Nome de usuário',
    },
    'cjsbj4wg': {
      'en': 'Remove',
      'pt': 'Remover',
    },
    '78fdfkdh': {
      'en': 'Add Members',
      'pt': 'Adicionar membros',
    },
    'rzrf0zsp': {
      'en': 'Assign',
      'pt': 'Atribuir',
    },
    'aygq6hhd': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    '70d3gp3g': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    'i5shsgmr': {
      'en': 'Username',
      'pt': 'Nome de usuário',
    },
    '5uym93b4': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    '8ohfceuq': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    'cf2slli6': {
      'en': 'Username',
      'pt': 'Nome de usuário',
    },
    'dcpf109l': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    'ntjxiluh': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    '70m6fdii': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    'vlair7ur': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    '76xe81xi': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // editProject
  {
    '7wmlszlo': {
      'en': 'Edit Project',
      'pt': 'Editar Projeto',
    },
    'wwzsnwbn': {
      'en': 'Project Name',
      'pt': 'Nome do Projeto',
    },
    'hyz5515g': {
      'en': 'Enter description here...',
      'pt': 'Insira a descrição aqui...',
    },
    '57dpf0bb': {
      'en': 'Save Changes',
      'pt': 'Salvar alterações',
    },
    'lp17x1az': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'ly4njc2q': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'wqm2ux47': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'cgdvh4bx': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
  },
  // drawerNav
  {
    'j81no67g': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    '1281zly2': {
      'en': '345',
      'pt': '345',
    },
    'ikdzucnf': {
      'en': 'Following',
      'pt': 'Seguindo',
    },
    '0mvvm3zs': {
      'en': '345',
      'pt': '345',
    },
    'ka33pk44': {
      'en': 'Followers',
      'pt': 'Seguidores',
    },
    'xnmol3vm': {
      'en': 'Tracker',
      'pt': 'Rastreador',
    },
    'tgp9100p': {
      'en': 'Projects',
      'pt': 'Projetos',
    },
    'gvsvhzns': {
      'en': 'Team',
      'pt': 'Equipe',
    },
    'r33amlko': {
      'en': 'About',
      'pt': 'Sobre',
    },
    'hfpu6vi1': {
      'en': 'Rate App',
      'pt': 'Avalie o aplicativo',
    },
    'of8ozb94': {
      'en': 'Log Out',
      'pt': 'Sair',
    },
  },
  // addTeam
  {
    'uap9xd08': {
      'en': 'Assign Member',
      'pt': 'Atribuir Membro',
    },
    'v3df17c1': {
      'en': 'Find members by searching below to add them to this task.',
      'pt':
          'Encontre membros pesquisando abaixo para adicioná-los a esta tarefa.',
    },
    '4gubn0rd': {
      'en': 'Search members...',
      'pt': 'Pesquisar membros...',
    },
    'k3vvd9ha': {
      'en': 'Assign',
      'pt': 'Atribuir',
    },
    'gts4h2ob': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    '5fcmvseb': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    'ipj4b3o2': {
      'en': 'Username',
      'pt': 'Nome de usuário',
    },
    'hwbisz08': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    '3t1qpdde': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    'hpq0skds': {
      'en': 'Username',
      'pt': 'Nome de usuário',
    },
    'zf4p0iqk': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    'gvttx09d': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    'jy6ian12': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    'm88gl572': {
      'en': 'View',
      'pt': 'Visualizar',
    },
  },
  // createNote
  {
    'i9im6f7s': {
      'en': 'Create Note',
      'pt': 'Criar nota',
    },
    'y8jieyz4': {
      'en': 'Create a note to keep your team in the loop.',
      'pt': 'Crie uma nota para manter sua equipe informada.',
    },
    'sq20csss': {
      'en': 'Enter your note here...',
      'pt': 'Insira sua nota aqui...',
    },
    'clj48a46': {
      'en': 'Create Note',
      'pt': 'Criar nota',
    },
  },
  // TaskComponent
  {
    'uuuaezib': {
      'en': 'Completed',
      'pt': 'Concluído',
    },
  },
  // WebNav
  {
    'nf1dqsbp': {
      'en': '3',
      'pt': '3',
    },
  },
  // changePhoto
  {
    'rveosbw6': {
      'en': 'Change Photo',
      'pt': 'Alterar foto',
    },
    'xkv4rj30': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'pt':
          'Carregue uma nova foto abaixo para alterar seu avatar visto por outros.',
    },
    '9jqfzztm': {
      'en': 'Upload Image',
      'pt': 'Carregar imagem',
    },
    'tnhsrx4j': {
      'en': 'Save Changes',
      'pt': 'Salvar alterações',
    },
  },
  // modal_Project
  {
    '4r29z75b': {
      'en': 'View All',
      'pt': 'Ver tudo',
    },
    't5thu3gr': {
      'en': 'Completed Tasks',
      'pt': 'Tarefas Concluídas',
    },
    'fycpdliq': {
      'en': 'Number of Tasks',
      'pt': 'Número de tarefas',
    },
    't39dexai': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    'uu14cs8r': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'ph74cymq': {
      'en': 'Issue #242952592',
      'pt': 'Edição nº 242952592',
    },
    'fe9x22ad': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    't725c9h5': {
      'en': 'Andres Reynolds',
      'pt': 'Andrés Reynolds',
    },
    '2rn0rm7g': {
      'en': 'Due',
      'pt': 'Devido',
    },
    '28tyqcfc': {
      'en': 'Tuesday, 10:00am',
      'pt': 'Terça-feira, 10:00 da manhã',
    },
    'gd3bhzsf': {
      'en': 'Completed',
      'pt': 'Concluído',
    },
    'y686s4b1': {
      'en': 'Complete',
      'pt': 'Completo',
    },
    'lcgypwk6': {
      'en': 'Completed on',
      'pt': 'Concluído em',
    },
    'dy7qxdlp': {
      'en': 'Activity',
      'pt': 'Atividade',
    },
    '99rgc554': {
      'en': 'Current Time',
      'pt': 'Hora atual',
    },
  },
  // modal_TaskDetails
  {
    'zerfwzgz': {
      'en': 'Mark as Complete',
      'pt': 'Marcar como concluído',
    },
    'fki0wi86': {
      'en': 'Begin Task',
      'pt': 'Iniciar tarefa',
    },
    'pj3j661s': {
      'en': 'Due',
      'pt': 'Devido',
    },
    'qwc3ia6n': {
      'en': ', ',
      'pt': ',',
    },
    '5bz5zdwp': {
      'en': 'Team Members',
      'pt': 'Membros da equipe',
    },
    'hc3gs7ga': {
      'en': 'Activity',
      'pt': 'Atividade',
    },
    'ru97sguf': {
      'en': 'Leave update here...',
      'pt': 'Deixe uma atualização aqui...',
    },
    '5xomb4rp': {
      'en': 'Submit',
      'pt': 'Enviar',
    },
  },
  // modal_UserProfile
  {
    'xbcjin31': {
      'en': 'Team Name',
      'pt': 'Nome da equipe',
    },
    's2rahhu0': {
      'en': ' - ',
      'pt': '-',
    },
    'f87wic4n': {
      'en': '12 Tasks',
      'pt': '12 tarefas',
    },
    '1r4s70n4': {
      'en': 'Team Bio',
      'pt': 'Biografia da equipe',
    },
    'ai2tvk8r': {
      'en': 'Tasks',
      'pt': 'Tarefas',
    },
    'k2fas9o8': {
      'en': 'Due',
      'pt': 'Devido',
    },
  },
  // modal_TaskCreate_1
  {
    'na5pbjsl': {
      'en': 'Choose Project',
      'pt': 'Escolha o projeto',
    },
    '7lc6cya0': {
      'en': 'Don\'t see your project? Add one here.',
      'pt': 'Não vê seu projeto? Adicione um aqui.',
    },
    'wyow03qm': {
      'en': 'Add Project',
      'pt': 'Adicionar Projeto',
    },
    '0advwx1u': {
      'en': 'Last edited:',
      'pt': 'Última edição:',
    },
    'ksmhvpjh': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    '2icxeqf5': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'bthhoi83': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    '9g6shlpz': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
  },
  // modal_CreateProject
  {
    'd3zhz60s': {
      'en': 'Create Project',
      'pt': 'Criar Projeto',
    },
    'ndua9r0o': {
      'en': 'Please add the name & description below.',
      'pt': 'Adicione o nome e a descrição abaixo.',
    },
    'ijnwlsug': {
      'en': 'Project Name',
      'pt': 'Nome do Projeto',
    },
    'l7qnilp2': {
      'en': 'Enter description here...',
      'pt': 'Insira a descrição aqui...',
    },
    'iou7k3x8': {
      'en': 'Assign Users',
      'pt': 'Atribuir usuários',
    },
    'h40v3y8u': {
      'en': 'Find members by searching below',
      'pt': 'Encontre membros pesquisando abaixo',
    },
    '74kovm7t': {
      'en': 'Assign',
      'pt': 'Atribuir',
    },
    'p9mvmaob': {
      'en': 'Create Project',
      'pt': 'Criar Projeto',
    },
    'zzv8enkj': {
      'en': 'Please enter a project name.',
      'pt': 'Insira um nome de projeto.',
    },
    '536ycszy': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'e68qg04m': {
      'en': 'Please enter a short description.',
      'pt': 'Insira uma breve descrição.',
    },
    'csybxpz6': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
  },
  // modal_TaskCreate_2
  {
    'fkb8cli1': {
      'en': 'Task Name',
      'pt': 'Nome da tarefa',
    },
    '5qwd78rp': {
      'en': 'Enter description here...',
      'pt': 'Insira a descrição aqui...',
    },
    'o1qo2qg3': {
      'en': 'Not Started',
      'pt': 'Não iniciado',
    },
    '3xt3njp6': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    'u0g3xflr': {
      'en': 'Complete',
      'pt': 'Completo',
    },
    'c2dtsnbb': {
      'en': 'Select Status',
      'pt': 'Selecione Status',
    },
    'udw09bms': {
      'en': 'Create Task',
      'pt': 'Criar tarefa',
    },
    'dgd9bazz': {
      'en': 'Please add a task name.',
      'pt': 'Adicione um nome para a tarefa.',
    },
    '510sc51m': {
      'en': 'Please enter at least 3 letters.',
      'pt': 'Por favor, insira pelo menos 3 letras.',
    },
    'grveqhde': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'jid8c04u': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'r242ro2z': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
  },
  // modal_Activity
  {
    '2issmdet': {
      'en': 'Notifications',
      'pt': 'Notificações',
    },
    '4z8dhmym': {
      'en': 'Project:',
      'pt': 'Projeto:',
    },
  },
  // modal_addMembers
  {
    'qgce8yzt': {
      'en': 'Add Members to project',
      'pt': 'Adicionar membros ao projeto',
    },
    'ncylrws1': {
      'en': 'Members in Project',
      'pt': 'Membros do Projeto',
    },
    'ddkg34qk': {
      'en': 'Remove',
      'pt': 'Remover',
    },
    'gw54o3ei': {
      'en': 'UserName',
      'pt': 'Nome de usuário',
    },
    '5ybblr1d': {
      'en': 'Remove',
      'pt': 'Remover',
    },
    'epngmu69': {
      'en': 'UserName',
      'pt': 'Nome de usuário',
    },
    '1qnvp80y': {
      'en': 'Remove',
      'pt': 'Remover',
    },
    'rxgjnrtl': {
      'en': 'Add Members',
      'pt': 'Adicionar membros',
    },
    'c69xi1a4': {
      'en': 'Assign',
      'pt': 'Atribuir',
    },
    'ac5i8pip': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    'bixtd6lt': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    's1ekanj3': {
      'en': 'Username',
      'pt': 'Nome de usuário',
    },
    'xtjlfcyr': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    '9rm7l3fs': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    'chsej9xj': {
      'en': 'Username',
      'pt': 'Nome de usuário',
    },
    'a1tcbxkr': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    'y6o0uvra': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    'fb7aygmy': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    'ug774jqi': {
      'en': 'View',
      'pt': 'Visualizar',
    },
  },
  // Miscellaneous
  {
    'tuf7ywhd': {
      'en': 'Label',
      'pt': 'Rótulo',
    },
    'z2zi1qq5': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'qm71wpil': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'fi5o91qd': {
      'en': '',
      'pt': '',
    },
    'skzc79wn': {
      'en': '',
      'pt': '',
    },
    '0rnqst8h': {
      'en': '',
      'pt': 'Erro: [error]',
    },
    'nh43oztv': {
      'en': '',
      'pt': 'E-mail de redefinição de senha enviado!',
    },
    'i4m03gv7': {
      'en': '',
      'pt': 'e-mail obrigatório!',
    },
    '9h5b120r': {
      'en': '',
      'pt': 'Número de telefone obrigatório e deve começar com +.',
    },
    '2xxt8j1o': {
      'en': '',
      'pt': 'Mensagem de senha não corresponde',
    },
    't7udujpl': {
      'en': '',
      'pt': 'insira a mensagem do código de verificação SMS',
    },
    'zbbv93d3': {
      'en': '',
      'pt':
          'Muito tempo desde o último login. Entre novamente antes de excluir sua conta.',
    },
    'dkifniog': {
      'en': '',
      'pt':
          'Muito tempo desde o último login. Entre novamente antes de atualizar sua conta.',
    },
    'vwozbhur': {
      'en': '',
      'pt': 'Digite a mensagem de confirmação de alteração de e-mail',
    },
    'rcviwvgb': {
      'en': '',
      'pt': 'E-mail já em uso por outra conta',
    },
    'atq42ovg': {
      'en': '',
      'pt':
          'A credencial de autenticação fornecida está incorreta, malformada ou expirou',
    },
    'cql4rcil': {
      'en': '',
      'pt': '',
    },
    't9vh67yu': {
      'en': '',
      'pt': 'Enviando arquivo...',
    },
    'ac2c7a8c': {
      'en': '',
      'pt': 'Sucesso',
    },
    '43t0g3v5': {
      'en': '',
      'pt': '',
    },
    'hxsgfsan': {
      'en': '',
      'pt': '',
    },
    'zuih46g4': {
      'en': '',
      'pt': '',
    },
    '8oo00kio': {
      'en': '',
      'pt': '',
    },
    'f4h7j5e1': {
      'en': '',
      'pt': '',
    },
    'dka0mr3o': {
      'en': '',
      'pt': '',
    },
    'a9x09f52': {
      'en': '',
      'pt': '',
    },
    'gn6bmhck': {
      'en': '',
      'pt': '',
    },
    'b9gx9zp0': {
      'en': '',
      'pt': '',
    },
    '3ogdlxsd': {
      'en': '',
      'pt': '',
    },
    'uxmsgxy2': {
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
