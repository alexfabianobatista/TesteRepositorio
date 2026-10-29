unit UCadastraAliquota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFCadastraAliquota = class(TForm)
    Label1: TLabel;
    MeAliquota: TMaskEdit;
    RGTipo: TRadioGroup;
    BtOk: TBitBtn;
    BtCancel: TBitBtn;
    procedure MeAliquotaExit(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    procedure CadastraAliquota;
    Procedure Analisa_iRetorno(iRetorno: integer);
    { Private declarations }
  public
    { Public declarations }
  end;
  //Dll
  function Bematech_FI_ProgramaAliquota( Aliquota: String; ICMS_ISS: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
var
  FCadastraAliquota: TFCadastraAliquota;

implementation

uses UBiblioteca;

{$R *.dfm}

Procedure TFCadastraAliquota.Analisa_iRetorno(iRetorno: integer);
Begin
    if iRetorno = 0 then
       Application.MessageBox( 'Erro de Comunicação !', 'Erro',
                                MB_IconError + MB_OK);

    If iRetorno = -1 Then
       Application.MessageBox( 'Erro de Execução na Função. Verifique!', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -2  then
       Application.MessageBox( 'Parâmetro Inválido !', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -3  then
       Application.MessageBox( 'Alíquota não programada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -4 Then
       Application.MessageBox( 'Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -5 Then
       Application.MessageBox( 'Erro ao Abrir a Porta de Comunicação', 'Erro',
                                MB_IconError + MB_OK);

    If iRetorno = -6 Then
       Application.MessageBox( 'Impressora Desligada ou Desconectada', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -7 Then
       Application.MessageBox( 'Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -8 Then
       Application.MessageBox( 'Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -18 then
       Application.MessageBox( 'Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -19 then
       Application.MessageBox( 'Parâmetro diferentes !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -20 then
       Application.MessageBox( 'Transação cancelada pelo Operador !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -21 then
       Application.MessageBox( 'A Transação não foi aprovada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -22 then
       Application.MessageBox( 'Não foi possível terminal a Impressão !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -23 then
       Application.MessageBox( 'Não foi possível terminal a Operação !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -24 then
       Application.MessageBox( 'Forma de pagamento não programada.', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -25 then
       Application.MessageBox( 'Totalizador não fiscal não programado.', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -26 then
       Application.MessageBox( 'Transação já Efetuada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -28 then
       Application.MessageBox( 'Não há Informações para serem Impressas !', 'Atenção',
                                MB_IconInformation + MB_OK);

end;

procedure TFCadastraAliquota.MeAliquotaExit(Sender: TObject);
begin
  if Trim(MeAliquota.Text) <> '' then
  begin
    Try
      MeAliquota.Text :=
        bib.SubstituiStr(MeAliquota.Text,'.',',');
      MeAliquota.Text :=
        FormatFloat('##,##00.00',StrToFloat(MeAliquota.Text));
    Except
      MessageDlg('Valor inválido', mtError, [mbOk],0);
      MeAliquota.SetFocus;
      MeAliquota.SelectAll;
    end;
  end;
end;

procedure TFCadastraAliquota.CadastraAliquota;
var wTipo,iRetorno: Integer;
begin
  if Trim(MeAliquota.Text) <> '' then
  begin
    try
      wTipo := RGTipo.ItemIndex;
      iRetorno := Bematech_FI_ProgramaAliquota(
        pchar( Trim(MeAliquota.Text) ), wTipo );
      Analisa_iRetorno(iRetorno);
    Except
      MessageDlg('Erro',
        mtError,[mbOk],0);
    end;
    MessageDlg('Alíquota cadastrada com sucesso',
      mtInformation,[mbOk],0);
  end;
end;

procedure TFCadastraAliquota.BtOkClick(Sender: TObject);
begin
  CadastraAliquota;
end;

end.
