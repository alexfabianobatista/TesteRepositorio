unit UFAtualizadataassinatura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TFAtualizadataassinatura = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    CBInput: TCheckBox;
    CBInput2: TCheckBox;
    CBInput3: TCheckBox;
    SBSend: TSpeedButton;
    SBCancel: TSpeedButton;
    procedure CBInputClick(Sender: TObject);
    procedure CBInput2Click(Sender: TObject);
    procedure CBInput3Click(Sender: TObject);
    procedure SBSendClick(Sender: TObject);
    procedure SBCancelClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FAtualizadataassinatura: TFAtualizadataassinatura;
  checked : String;
  

implementation
uses
 UCadastro_cl, UNotaSaida_cl, UOracle_cl, DateUtils;
{$R *.dfm}

procedure TFAtualizadataassinatura.CBInputClick(Sender: TObject);
begin
checked := 'M';
  if CBInput.Checked = true then
  begin
     CBInput2.Enabled := false;
     CBInput3.Enabled := false;
  end;
  if CBInput.Checked = false then
  begin
     CBInput2.Enabled := true;
     CBInput3.Enabled := true;
  end;

  
end;

procedure TFAtualizadataassinatura.CBInput2Click(Sender: TObject);
begin
checked := '1N';
  if CBInput2.Checked = true then
    begin
     CBInput.Enabled := false;
     CBInput3.Enabled := false;
    end;
  if CBInput2.Checked = false then
  begin
     CBInput.Enabled := true;
     CBInput3.Enabled := true;
  end;
end;

procedure TFAtualizadataassinatura.CBInput3Click(Sender: TObject);

begin
checked := '2N';
  if CBInput3.Checked = true then
  begin
     CBInput2.Enabled := false;
     CBInput.Enabled := false;
  end;
  if CBInput3.Checked = false then
  begin
     CBInput2.Enabled := true;
     CBInput.Enabled := true;
  end;
end;

procedure TFAtualizadataassinatura.SBSendClick(Sender: TObject);
var
 datevenc: TDateTime;
begin
  datevenc := Now;

  if( checked = 'M' ) then
  begin
    datevenc := IncMonth(datevenc, 6);
    ShowMessage('Data de vencimento atualizada para: ' + DateToStr(datevenc));
    with DMOracle do
    begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_CADASTRO SET DT_VENCIMENTO_TABELA_PRECO = ' + chr(39) + DateToStr(datevenc) + chr(39));
      QExecSQL.SQL.Add('WHERE COD_CADASTRO =' + IntTosTR(DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value));
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    end;
    checked := 'OK';
    FAtualizadataassinatura.Close;
  end;
  if( checked = '1N' ) then
  begin
    datevenc := IncYear(datevenc, 1);
    ShowMessage('Data de vencimento atualizada para: ' +DateToStr(datevenc));
    with DMOracle do
    begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_CADASTRO SET DT_VENCIMENTO_TABELA_PRECO = ' + chr(39) + DateToStr(datevenc) + chr(39));
      QExecSQL.SQL.Add('WHERE COD_CADASTRO =' + IntTosTR(DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value));
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    end;
    checked := 'OK';
    FAtualizadataassinatura.Close;
  end;
  if( checked = '2N' ) then
  begin
    datevenc := IncYear(datevenc, 2);
    ShowMessage('Data de vencimento atualizada para: ' + DateToStr(datevenc));
    with DMOracle do
    begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_CADASTRO SET DT_VENCIMENTO_TABELA_PRECO = ' + chr(39) + DateToStr(datevenc) + chr(39));
      QExecSQL.SQL.Add('WHERE COD_CADASTRO =' + IntTosTR(DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value));
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    end;
    checked := 'OK';
    FAtualizadataassinatura.Close;
  end;
  if( checked = '' ) then
  begin
    ShowMessage('Você precisa informar um periodo de assinatura');
  end;
end;
procedure TFAtualizadataassinatura.SBCancelClick(Sender: TObject);
begin
    FAtualizadataassinatura.Close;
end;

end.
