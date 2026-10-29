unit UOrdemServicoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFOrdemServicoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label9: TLabel;
    Bt0Filial: TBitBtn;
    ME0Filial: TMaskEdit;
    Ed0Filial: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Bt1ConsFilial: TBitBtn;
    ME1Filial: TMaskEdit;
    Ed1Filial: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ME1DataI: TMaskEdit;
    ME1DataF: TMaskEdit;
    TabSheet3: TTabSheet;
    Label6: TLabel;
    Bt2ConsFilial: TBitBtn;
    ME2Filial: TMaskEdit;
    Ed2Filial: TEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    ME2DataI: TMaskEdit;
    ME2DataF: TMaskEdit;
    TabSheet4: TTabSheet;
    Label10: TLabel;
    Bt3ConsFilial: TBitBtn;
    ME3Filial: TMaskEdit;
    Ed3Filial: TEdit;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Me3DataI: TMaskEdit;
    Me3DataF: TMaskEdit;
    Label13: TLabel;
    Bt1Cadastro: TBitBtn;
    Me1Cadastro: TMaskEdit;
    Ed1Cadastro: TEdit;
    Label14: TLabel;
    Bt0Cadastro: TBitBtn;
    ME0Cadastro: TMaskEdit;
    ED0Cadastro: TEdit;
    procedure ME0FilialExit(Sender: TObject);
    procedure Bt0FilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ME1FilialExit(Sender: TObject);
    procedure Bt1ConsFilialClick(Sender: TObject);
    procedure ME2FilialExit(Sender: TObject);
    procedure Bt2ConsFilialClick(Sender: TObject);
    procedure ME3FilialExit(Sender: TObject);
    procedure Bt3ConsFilialClick(Sender: TObject);
    procedure Me1CadastroExit(Sender: TObject);
    procedure Bt1CadastroClick(Sender: TObject);
    procedure ME0CadastroExit(Sender: TObject);
    procedure Bt0CadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrdemServicoParam: TFOrdemServicoParam;

implementation

uses UFilial_cl, UFilialCons, UUsuario_cl, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFOrdemServicoParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.ParamByName('PK').AsFloat := StrToFloat(ME0Filial.Text);
    QFilial.Open;
    // CB0Filial.Checked := False;
    Ed0Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed0Filial.Text := 'Todos';
end;

procedure TFOrdemServicoParam.Bt0FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME0FilialExit(Self);
  End;
end;

procedure TFOrdemServicoParam.FormCreate(Sender: TObject);
Var wAno,wMes,wDia : Word;
begin
  inherited;
  DecodeDate(Date,wAno,wMes,wDia);
  ME0DataI.Text := '01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno);
  ME0DataF.Text := DateToStr( Date );
  ME0Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME0FilialExit(Self);
  ME1DataI.Text := ME0DataI.Text;
  ME1DataF.Text := ME0DataF.Text;
  ME1Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME1FilialExit(Self);
  ME2DataI.Text := ME0DataI.Text;
  ME2DataF.Text := ME0DataF.Text;
  ME2Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME2FilialExit(Self);
  ME3DataI.Text := '01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno);
  ME3DataF.Text := DateToStr( Date );
  ME3Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME3FilialExit(Self);

end;

procedure TFOrdemServicoParam.ME1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Filial.Text) <> '' then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.ParamByName('PK').AsFloat := StrToFloat(ME1Filial.Text);
    QFilial.Open;
    // CB0Filial.Checked := False;
    Ed1Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed1Filial.Text := 'Todos';
end;

procedure TFOrdemServicoParam.Bt1ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME1FilialExit(Self);
  End;
end;

procedure TFOrdemServicoParam.ME2FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Filial.Text) <> '' then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.ParamByName('PK').AsFloat := StrToFloat(ME2Filial.Text);
    QFilial.Open;
    // CB0Filial.Checked := False;
    Ed2Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed2Filial.Text := 'Todos';
end;

procedure TFOrdemServicoParam.Bt2ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME2Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME2FilialExit(Self);
  End;
end;

procedure TFOrdemServicoParam.ME3FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Filial.Text) <> '' then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.ParamByName('PK').AsFloat := StrToFloat(ME3Filial.Text);
    QFilial.Open;
    Ed3Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed3Filial.Text := 'Todos';
end;

procedure TFOrdemServicoParam.Bt3ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME3Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME3FilialExit(Self);
  End;
end;

procedure TFOrdemServicoParam.Me1CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Cadastro.Text) <> '' then
  With DMCadastro do
  Begin
    QCadastro.Close;
    QCadastro.ParamByName('PK').AsFloat := StrToFloat(ME1Cadastro.Text);
    QCadastro.Open;
    // CB0Filial.Checked := False;
    Ed1Cadastro.Text := QCadastroNome.Value;
  End
  Else
    Ed1Cadastro.Text := 'Todos';

end;

procedure TFOrdemServicoParam.Bt1CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME1Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME1CadastroExit(Self);
  End;

end;

procedure TFOrdemServicoParam.ME0CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Cadastro.Text) <> '' then
  With DMCadastro do
  Begin
    QCadastro.Close;
    QCadastro.ParamByName('PK').AsFloat := StrToFloat(ME0Cadastro.Text);
    QCadastro.Open;
    // CB0Filial.Checked := False;
    Ed0Cadastro.Text := QCadastroNome.Value;
  End
  Else
    Ed0Cadastro.Text := 'Todos';


end;

procedure TFOrdemServicoParam.Bt0CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME0Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME0CadastroExit(Self);
  End;

end;

end.
