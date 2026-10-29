unit UCaixaSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Mask, variants;

type
  TFCaixaSaldo = class(TForm)
    GroupBox1: TGroupBox;
    ME3DtInicial: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LSaldoAtual: TLabel;
    LSaldoAnterior: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    ME3CodFilial: TMaskEdit;
    ME3Filial: TMaskEdit;
    ME3CodDepto: TMaskEdit;
    ME3Departamento: TMaskEdit;
    CB3TodosFilial: TCheckBox;
    CB3TodosDepartamento: TCheckBox;
    LEntradas: TLabel;
    LSaidas: TLabel;
    SpeedButton1: TSpeedButton;
    procedure ME3CodFilialChange(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure CB3TodosFilialClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ME3CodDeptoChange(Sender: TObject);
    procedure CB3TodosDepartamentoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ME3CodFilialExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCaixaSaldo: TFCaixaSaldo;

implementation

uses UOracle_cl, UFilialCons, UDepartamentoCons, UFilial_cl,
  UDepartamento_cl, UCaixaParam, UCaixa_cl, UParamSistema_cl, UUsuario_cl,
  UCaixaRel_cl;

{$R *.DFM}

procedure TFCaixaSaldo.ME3CodFilialChange(Sender: TObject);
begin
  if Trim(ME3CodFilial.text)<>'' then
    begin
      ME3Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL ='+ME3CodFilial.Text);
      CB3TodosFilial.Checked:=False;
    end
  else
    begin
      ME3Filial.Clear;
      CB3TodosFilial.Checked:=True;
    end
end;

procedure TFCaixaSaldo.SpeedButton7Click(Sender: TObject);
begin
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.Showmodal=mrOk then
    ME3CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFCaixaSaldo.CB3TodosFilialClick(Sender: TObject);
begin
  If CB3TodosFilial.Checked=True then
    ME3CodFilial.Clear;
end;

procedure TFCaixaSaldo.SpeedButton8Click(Sender: TObject);
begin
  if FDepartamentoCons = Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.Showmodal=mrOk then
    ME3CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFCaixaSaldo.ME3CodDeptoChange(Sender: TObject);
begin
  if Trim(ME3CodDepto.text)<>'' then
    begin
      ME3Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO ='+ME3CodDepto.Text);
      CB3TodosDepartamento.Checked:=False;
    end
  else
    begin
      ME3Departamento.Clear;
      CB3TodosDepartamento.Checked:=True;
    end
end;

procedure TFCaixaSaldo.CB3TodosDepartamentoClick(Sender: TObject);
begin
  If CB3TodosDepartamento.Checked=True then
    ME3CodDepto.Clear;
end;

procedure TFCaixaSaldo.SpeedButton1Click(Sender: TObject);
var
   wReceita,WDespesa:Real;
   i:integer;
begin
  DMOracle.ValidaFilial(ME3CodFilial.Text);
  DmUsuario.Checar_Filial_Usuario(ME3CodFilial.Text,'CAIXA');
  with DMCaixaRel  do
    begin
      DMCaixa.QSaldo.Close;
      if Trim(ME3DtInicial.Text) = '' then
         Raise Exception.Create ('Data de Referência Deve Ser Informada');

      DMCaixa.QSaldo.SetVariable('DT_FINAL',StrToDate(ME3DtInicial.Text)-1);

      if Trim(ME3CodFilial.Text)<>'' then
        DMCaixa.QSaldo.SetVariable('COD_FILIAL',StrToInt(Trim(ME3CodFilial.Text)))
      else
        DMCaixa.QSaldo.SetVariable('COD_FILIAL',Null);

      if Trim(ME3CodDepto.Text)<>'' then
        DMCaixa.QSaldo.SetVariable('DEPARTAMENTOS', 'TB_CAIXA_MOV.COD_DEPARTAMENTO IN (' + Trim(ME3CodDepto.Text) + ')')
      else
        DMCaixa.QSaldo.SetVariable('DEPARTAMENTOS', '1=1');
      DMCaixa.QSaldo.SetVariable('COD_HISTORICO', Null);
      DMCaixa.QSaldo.SetVariable('COD_HISTORICO_F', Null);
      DMCaixa.QSaldo.Open;

      QRCaixa_MovCaixa.Close;
      if Trim(ME3CodFilial.Text)<>'' then
        QRCaixa_MovCaixa.SetVariable('COD_FILIAL',StrToInt(Trim(ME3CodFilial.Text)))
      else
        QRCaixa_MovCaixa.SetVariable('COD_FILIAL',Null);

      if Trim(ME3CodDepto.Text)<>'' then
        QRCaixa_MovCaixa.SetVariable('DEPARTAMENTOS', 'TB_CAIXA_MOV.COD_DEPARTAMENTO IN (' + Trim(ME3CodDepto.Text) + ')')
      else
        QRCaixa_MovCaixa.SetVariable('DEPARTAMENTOS', '1=1');
      QRCaixa_MovCaixa.SetVariable('COD_HISTORICO', Null);
      QRCaixa_MovCaixa.SetVariable('COD_HISTORICO_F', Null);
      QRCaixa_MovCaixa.SetVariable('COD_CADASTRO', Null);

      QRCaixa_MovCaixa.SetVariable('DT_INICIAL',StrToDate(ME3DtInicial.Text));
      QRCaixa_MovCaixa.SetVariable('DT_FINAL',StrToDate(ME3DtInicial.Text));

      QRCaixa_MovCaixa.Open;
      wReceita:=0;
      wDespesa:=0;
      QRCaixa_MovCaixa.first;
      for i:=1 to QRCaixa_MovCaixa.recordcount do
        begin
          if QRCaixa_MovCaixaInd_Operacao.Value='+' then
            wReceita:=wReceita+QRCaixa_MovCaixaVal_Movimento.Value
          else
            wDespesa:=wDespesa+QRCaixa_MovCaixaVal_Movimento.Value;
          QRCaixa_MovCaixa.Next;
        end;
    end;
  LSaldoAnterior.Caption:=FormatFloat('#,##0.00',DMCaixa.QSaldoCredito.Value-DMCaixa.QSaldoDebito.Value);
  LEntradas.Caption:=FormatFloat('#,##0.00',wReceita);
  LSaidas.Caption:=FormatFloat('#,##0.00',wDespesa);
  LSaldoAtual.Caption:=FormatFloat('#,##0.00',DMCaixa.QSaldoCredito.Value-DMCaixa.QSaldoDebito.Value+wReceita-wDespesa);
end;

procedure TFCaixaSaldo.FormActivate(Sender: TObject);
begin
  ME3CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME3DtInicial.Text:=DateToStr(Date());
end;

procedure TFCaixaSaldo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with DMCaixaRel  do
    begin
      DMCaixa.QSaldo.Close;
      QRCaixa_MovCaixa.Close;
    End;
  Action := CaFree;
  FCaixaSaldo := Nil;
end;

procedure TFCaixaSaldo.ME3CodFilialExit(Sender: TObject);
begin
  DMOracle.ValidaFilial(ME3CodFilial.Text);
end;

end.
