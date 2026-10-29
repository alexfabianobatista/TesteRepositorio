unit UReciboParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFReciboParam = class(TForm)
    BtOk: TBitBtn;
    BitBtn1: TBitBtn;
    Label10: TLabel;
    BtConsFilial: TBitBtn;
    MEFilial: TMaskEdit;
    EdFilial: TEdit;
    MENumRecibo: TMaskEdit;
    MENumOS: TMaskEdit;
    MEValor: TMaskEdit;
    MEReferente: TMaskEdit;
    MECliente: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MEData: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    MEResponsavel: TMaskEdit;
    procedure BtOkClick(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReciboParam: TFReciboParam;

implementation

uses UOrdemServico_cl, UFilial_cl, URRecibo, UFilialCons;

{$R *.DFM}

procedure TFReciboParam.BtOkClick(Sender: TObject);
begin
  With DMOrdemServico do
  Begin
    ModalResult := mrNone;
    If Trim(MEFilial.Text) = '' Then
      Raise Exception.Create('Filial não Informada!');
    If Trim(MEValor.Text) = '' Then
      Raise Exception.Create('Valor não Informado!');
    If Trim(MEData.Text) = '' Then
      Raise Exception.Create('Data não Informada!');
    If Trim(MECliente.Text) = '' Then
      Raise Exception.Create('Cliente não Informado!');
    If Trim(MEReferente.Text) = '' Then
      Raise Exception.Create('Referencia não Informada!');
    If Trim(MEResponsavel.Text) = '' Then
      Raise Exception.Create('Responsável não Informado!');
    With DMFilial do
    Begin
      QFilial.Close;
      QFilial.ParamByName('PK').AsFloat := StrToFloat(MEFilial.Text);
      QFilial.Open;
    End;
    If FRRecibo = Nil Then
      FRRecibo := TFRRecibo.Create(Application);
    With FRRecibo do
    Begin
      QRLNumRecibo.Caption := MENumRecibo.Text;
      QRLNumOS.Caption := MENumOS.Text;
      pValor := StrTofloat(MEValor.Text);
      // QRLValor.Caption := MEValor.Text;
      QRLCliente.Caption := MECliente.Text;
      QRLReferente.Caption := MEReferente.Text;
      QRLData.Caption := MEData.Text;
      QRLResponsavel.Caption := MEResponsavel.Text;
    End;
    FRRecibo.QRPrimario.Preview;
    ModalResult := mrOk;
  End;
end;

procedure TFReciboParam.MEFilialExit(Sender: TObject);
begin
  If Trim(MEFilial.Text) <> '' then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.ParamByName('PK').AsFloat := StrToFloat(MEFilial.Text);
    QFilial.Open;
    EdFilial.Text := QFilialDesc_Filial.Value;
  End
  Else
    EdFilial.Text := 'Todos';
end;

procedure TFReciboParam.BtConsFilialClick(Sender: TObject);
begin
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    MEFilialExit(Self);
  End;
end;

end.
