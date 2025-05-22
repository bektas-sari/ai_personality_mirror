import 'package:flutter/material.dart';

void main() {
  runApp(const PersonalityMirrorApp());
}

class PersonalityMirrorApp extends StatelessWidget {
  const PersonalityMirrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Personality Mirror',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const PersonalityHomePage(),
    );
  }
}

class PersonalityHomePage extends StatefulWidget {
  const PersonalityHomePage({super.key});

  @override
  State<PersonalityHomePage> createState() => _PersonalityHomePageState();
}

class _PersonalityHomePageState extends State<PersonalityHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _analysisResult = '';
  bool _isLoading = false;

  void _analyzePersonality() {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    setState(() {
      _isLoading = true;
      _analysisResult = '';
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        _analysisResult = '''
👤 **MBTI Type**: INFP - The Mediator  
💪 **Strengths**: Empathetic, creative, deep thinker  
⚠️ **Watch out for**: Overthinking, idealism  
💡 **Tip**: Turn your sensitivity into strength by setting small, achievable goals.
''';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Personality Mirror'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Introduce yourself in a few sentences...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _analyzePersonality,
              icon: const Icon(Icons.psychology),
              label: const Text('Analyze'),
            ),
            const SizedBox(height: 24),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_analysisResult.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _analysisResult,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),

    );
  }
}
