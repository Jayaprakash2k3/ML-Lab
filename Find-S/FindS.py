def find_s_algorithm(data):
    hypothesis = data[0]
    for example in data:
        if example[-1] == 'Yes':
            for i in range(len(hypothesis)):
                if example[i] != hypothesis[i]:
                    hypothesis[i] = '?'
    return hypothesis
data = [
    ['Sunny', 'Warm', 'Normal', 'Strong', 'Warm', 'Same', 'Yes'],
    ['Sunny', 'Warm', 'High', 'Strong', 'Warm', 'Same', 'Yes'],
    ['Rainy', 'Cold', 'High', 'Strong', 'Warm', 'Change', 'No'],
    ['Sunny', 'Warm', 'High', 'Strong', 'Cool', 'Change', 'Yes']
]

hypothesis = find_s_algorithm(data)
print(hypothesis)
