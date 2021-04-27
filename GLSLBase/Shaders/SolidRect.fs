#version 450

layout(location=0) out vec4 FragColor; // 사용자 정의 입력 값

//uniform vec4 u_Color;

void main()
{
	FragColor = vec4(1,0,0,1);
	//FragColor = u_Color;
}
