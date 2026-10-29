unit UEstadia_CP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask;

type
  TFEstadia_CP = class(TForm)
    Label1: TLabel;
    MECodFinalidade: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MEFinalidade: TMaskEdit;
    Label2: TLabel;
    MECodbanco: TMaskEdit;
    SpeedButton2: TSpeedButton;
    MEBanco: TMaskEdit;
    Label3: TLabel;
    MECodDepartamento: TMaskEdit;
    SpeedButton3: TSpeedButton;
    MEDepartamento: TMaskEdit;
    BtConfirma: TButton;
    BtCancelar: TBitBtn;
    MEDt_Vencimento: TMaskEdit;
    Label4: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MECodFinalidadeExit(Sender: TObject);
    procedure MECodbancoExit(Sender: TObject);
    procedure MECodDepartamentoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstadia_CP: TFEstadia_CP;

implementation

uses UFinalidadeCons, UFinalidade_cl, UBancosCons, UBancoAgencia_cl,
  UDepartamentoCons, UDepartamento_cl, UOracle_cl;

{$R *.DFM}

procedure TFEstadia_CP.SpeedButton1Click(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal=mrOk then
   begin
     MECodFinalidade.text:=Floattostr(DMFinalidade.QFinalidadeConsCod_finalidade.Value);
     MECodFinalidadeExit(Self);
   end;
end;

procedure TFEstadia_CP.SpeedButton2Click(Sender: TObject);
begin
  If FBancosCons = Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    begin
      MECodbanco.text:=Floattostr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
      MECodBancoExit(Self);
    end;
end;

procedure TFEstadia_CP.SpeedButton3Click(Sender: TObject);
begin
  If FdepartamentoCons = Nil then
     FdepartamentoCons:=TFdepartamentoCons.Create(Application);
  if FdepartamentoCons.ShowModal=mrOk then
   begin
     MECodDepartamento.text:=Floattostr(DMDepartamento.QdepartamentoConsCod_departamento.Value);
     MECodDepartamentoExit(Self);
   end;
end;

procedure TFEstadia_CP.MECodFinalidadeExit(Sender: TObject);
begin
  if Trim(MECodFinalidade.Text)<>'' then
    MEFinalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MECodFinalidade.Text)
  else
    MEFinalidade.Clear;
end;

procedure TFEstadia_CP.MECodbancoExit(Sender: TObject);
begin
  if Trim(MECodBanco.text)<>'' then
    MEBanco.text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MEcodbanco.text)
  else
    MEBanco.Clear;
end;

procedure TFEstadia_CP.MECodDepartamentoExit(Sender: TObject);
begin
  if Trim(MECodDepartamento.text)<>'' then
    MEDepartamento.text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MECodDepartamento.text)
  else
    MEDepartamento.Clear;
end;

end.
