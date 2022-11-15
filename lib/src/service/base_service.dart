class BaseApi {
  final String _baseUrl = "https://exercises-by-api-ninjas.p.rapidapi.com/";
  final String _version = "v1/";
  final String _exercises = "exercises/";

  final Map<String, String> _headers = {
    'X-RapidAPI-Key': "9d39257fc9msh1241c310b08d1dap12a245jsn4f560faff2e9",
    'X-RapidAPI-Host': "exercises-by-api-ninjas.p.rapidapi.com"
  };

  String getBaseUrl() => _baseUrl;
  String getExercisesUrl() => _baseUrl + _version + _exercises;
  Map<String, String> getHeaders() => _headers;
}
