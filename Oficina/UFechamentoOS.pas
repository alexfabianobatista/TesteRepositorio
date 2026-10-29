unit UFechamentoOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, StdCtrls, Buttons, Mask;

type
  TFOFI0018 = class(TForm)
    Label1: TLabel;
    MEOS: TMaskEdit;
    BtnConfirmar: TBitBtn;
    Label2: TLabel;
    MESenha: TMaskEdit;
    btnCofirmarVoltaOS: TBitBtn;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure MESenhaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCofirmarVoltaOSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0018: TFOFI0018;

implementation

uses UOficina_cl, UOracle_cl;

{$R *.DFM}

procedure TFOFI0018.BtnConfirmarClick(Sender: TObject);
begin
  if Trim(MESenha.Text) = '210169' then
  begin
    if Trim(MEOS.Text) <> '' then
    begin
      with DMOficina do
      begin
        QOSFechamento.Close;
        QOSFechamento.SetVariable('PK',MEOS.Text);
        QOSFechamento.Open;
        //se empresa não for de AGRONEWS
        if QOSFechamento.State = DsInactive then
          raise Exception.Create('O.S. '+Trim(MEOS.Text)+' já está fechada!');
        //....
        if QOSFechamento.RecordCount = 0 then
           raise exception.Create('Não foi encontrada O.S. '+Trim(MEOS.Text)+' com número informado!');
        if QOSFechamentoIND_SITUACAO.Value = 'F' then
           raise exception.Create('O.S. '+Trim(MEOS.Text)+' já está fechada!');

        if MessageDlg('Confirma fechamento da O.S. '+Trim(MEOS.Text)+' ?',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Try
           QOSFechamento.Edit;
           QOSFechamentoIND_SITUACAO.Value:= 'F';
           QOSFechamentoDT_FECHAMENTO.Value:= DMOracle.DataServ;
           QOSFechamento.Post;
           MEOS.Text:= '';
           MessageDlg('O.S foi fechada com sucesso!',mtInformation,[mbOk],0);
          except
            raise;
          end;
        end;
        QOSFechamento.Close;
      end;
    end;
  end;  
end;

procedure TFOFI0018.MESenhaExit(Sender: TObject);
begin
  if Trim(MESenha.Text) = '210169' then
  begin
    MESenha.Visible:= False;
    Label2.Visible:= False;
  end;
end;

procedure TFOFI0018.FormActivate(Sender: TObject);
begin
  MESenha.Visible:= True;
  Label2.Visible:= True;
end;

procedure TFOFI0018.btnCofirmarVoltaOSClick(Sender: TObject);
begin
  if Trim(MEOS.Text) <> '' then
  begin
  with DMOficina do
    begin
      QOSVoltaFechamento.Close;
      QOSVoltaFechamento.SetVariable('PK', MEOS.Text);
      QOSVoltaFechamento.Open;

      if QOSVoltaFechamento.RecordCount = 0 then
        raise exception.Create('O.S. informada não foi encontrada ou não está fechada! Verifique!');

      if QOSVoltaFechamentoIND_SITUACAO.Value <> 'F' then
        raise exception.Create('O.S. não está fechada!');

      if MessageDlg('Confirma volta da O.S. '+Trim(MEOS.Text)+' ?',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        try
          QOSVoltaFechamento.Edit;
          QOSVoltaFechamentoIND_SITUACAO.Value := 'A'; // Aberta.
          QOSVoltaFechamento.Post;
          MEOS.Text:= '';
          Application.MessageBox('Volta da O.S realizado com sucesso!', 'Atenção', MB_ICONINFORMATION or MB_OK);
          DMOracle.DBCemapa.Commit; // nao tava dando commit na volta da OS.
        except
          raise;
        end;
      end;
      QOSVoltaFechamento.Close;
    end;
  end;
end;

end.
