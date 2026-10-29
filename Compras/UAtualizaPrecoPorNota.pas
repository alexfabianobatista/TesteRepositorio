unit UAtualizaPrecoPorNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, Buttons, Mask;

type
  TFAtualizaPrecoPorNota = class(TForm)
    DsItensNota: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    MePercentual: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LbPercReajAtacado: TLabel;
    MePercentualAtacado: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarPrecoFINESTRA(Sender: TObject);
    procedure AtualizarPreco(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FAtualizaPrecoPorNota: TFAtualizaPrecoPorNota;

implementation

uses UNotaEntrada_cl, UParamSistema_cl, UOracle_cl, UBiblioteca,
  UUsuario_cl;

{$R *.dfm}

procedure TFAtualizaPrecoPorNota.FormActivate(Sender: TObject);
begin
  if DMParamSistema.CodEmpresa = 'PAULINHO' then
    FAtualizaPrecoPorNota.WindowState := wsMaximized;
  if (DMParamSistema.CodEmpresa <> 'CASATINTAS')  then   // MUDAR VALOR ATACADO(CASA DAS TINTAS) Junior - 19/03/2018.
  begin
    DBGrid1.Columns.Items[9].Visible := False;
    DBGrid1.Columns.Items[10].Visible := False;
    DBGrid1.Columns.Items[11].Visible := False;
  end;
  if (DMParamSistema.CodEmpresa = 'NUTRIR') then
  begin
    LbPercReajAtacado.Visible := True;
    MePercentualAtacado.Visible := True;
    DBGrid1.Columns.Items[9].Visible := True;
    DBGrid1.Columns.Items[10].Visible := True;
    DBGrid1.Columns.Items[11].Visible := True;
  end;
  DMNotaEntrada.CdsAlteraPreco.Close;
  DMNotaEntrada.CdsAlteraPreco.Open;
  DMNotaEntrada.CDSAlteraPreco.DisableControls;
  DMNotaEntrada.CdsAlteraPreco.First;
  While Not (DMNotaEntrada.CdsAlteraPreco.Eof) Do
   Begin
     If DMNotaEntrada.CdsAlteraPrecoPerc_Margem_Varejo.Value > 0 Then
      Begin
        DMNotaEntrada.CdsAlteraPreco.Edit;
        DMNotaEntrada.CdsAlteraPrecoVal_Unitario_Tabela.Value := DMNotaEntrada.CdsAlteraPrecoVal_Custo.Value + (DMNotaEntrada.CdsAlteraPrecoVal_Custo.Value *
          (Bib.ift(DMNotaEntrada.CdsAlteraPrecoPerc_Margem_Varejo.Value / 100 = 0, 1, DMNotaEntrada.CdsAlteraPrecoPerc_Margem_Varejo.Value / 100)));
        If DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR' Then
           DMNotaEntrada.CdsAlteraPrecoVal_Unitario_Tabela.Value := Trunc(DMNotaEntrada.CdsAlteraPrecoVal_Unitario_Tabela.Value);
        DMNotaEntrada.CdsAlteraPreco.Post;
      End;
     DMNotaEntrada.CdsAlteraPreco.Next;
   End;
  DMNotaEntrada.CDSAlteraPreco.EnableControls;
end;

procedure TFAtualizaPrecoPorNota.BitBtn1Click(Sender: TObject);
begin
  If Trim(MePercentual.Text) = '' Then
     Raise exception.Create('Informe percentual para reajuste');
  DMNotaEntrada.CDSAlteraPreco.DisableControls;
  DMNotaEntrada.CdsAlteraPreco.First;
  While Not (DMNotaEntrada.CdsAlteraPreco.Eof) Do
   Begin
     DMNotaEntrada.CDSAlteraPreco.Edit;
     DMNotaEntrada.CDSAlteraPrecoPERC_REAJUSTE.Value := StrToFloat(Bib.TrocaVirgulaPorPonto(MePercentual.Text));
     if Trim(MePercentualAtacado.Text) <> '' then
       DMNotaEntrada.CDSAlteraPrecoPERC_REAJUSTE_ATACADO.Value := StrToFloat(Bib.TrocaVirgulaPorPonto(MePercentualAtacado.Text));
     DMNotaEntrada.CDSAlteraPreco.Post;
     DMNotaEntrada.CdsAlteraPreco.Next;
   End;
  DMNotaEntrada.CDSAlteraPreco.EnableControls;
end;

procedure TFAtualizaPrecoPorNota.BitBtn2Click(Sender: TObject);
var wAudit: string;
begin
  if MessageDlg('Deseja alterar o preço de venda dos produtos?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMNotaEntrada.CdsAlteraPreco.First;
    DBGrid1.DataSource.DataSet.DisableControls;
    While Not (DMNotaEntrada.CdsAlteraPreco.Eof) Do
    Begin
      if DMParamSistema.CodEmpresa = 'FINESTRA' then //Mudei dessa forma para facilitar o suporte no código. Junior 20/02/23
         AtualizarPrecoFINESTRA(Sender)
       else
         AtualizarPreco(Sender);
      DMNotaEntrada.CdsAlteraPreco.Next;
    End;
    MessageDlg('Preço(s) atualizado(s).', mtConfirmation, [mbOK], 0);
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
    DBGrid1.DataSource.DataSet.EnableControls;
    DMNotaEntrada.CDSAlteraPreco.Close;
    DMNotaEntrada.CDSAlteraPreco.Open;

  end;
end;

procedure TFAtualizaPrecoPorNota.AtualizarPrecoFINESTRA(Sender: TObject); //LaFinestra precisa gravar o %da Margem no produto. Junior 20/02/23.
begin
  if DMNotaEntrada.CDSAlteraPrecoVAL_UNITARIO_TABELA.Text <> '' then
   begin
    DMOracle.QExecSQL.close;
    DMOracle.QExecSQL.SQL;
    DMOracle.QExecSQL.sql.Clear;
    DMOracle.QExecSQL.sql.Add('UPDATE TB_PRODUTO SET COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente) +
                              ', VAL_VAREJO = ' + Bib.TrocaVirgulaPorPonto(FloatToStr(DMNotaEntrada.CdsAlteraPrecoVal_Unitario_Tabela.Value))+
                              ', PERC_MARGEM_VAREJO = ' + Bib.TrocaVirgulaPorPonto(FloatToStr(DMNotaEntrada.CDSAlteraPrecoPERC_REAJUSTE.Value)) +
                              ' WHERE COD_PRODUTO = ' + DMNotaEntrada.CdsAlteraPrecoCod_Produto.Text);
    DMOracle.QExecSQL.ExecSQL;
  end;
end;

procedure TFAtualizaPrecoPorNota.AtualizarPreco(Sender: TObject);
begin
  if DMNotaEntrada.CDSAlteraPrecoVAL_UNITARIO_TABELA.Text <> '' then  //Junior - 25/09/2018.
  begin
    DMOracle.QExecSQL.close;
    DMOracle.QExecSQL.SQL;
    DMOracle.QExecSQL.sql.Clear;
    DMOracle.QExecSQL.sql.Add('UPDATE TB_PRODUTO SET COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente) + ', VAL_VAREJO = ' +
    Bib.TrocaVirgulaPorPonto(FloatToStr(DMNotaEntrada.CdsAlteraPrecoVal_Unitario_Tabela.Value)) +
    ' WHERE COD_PRODUTO = ' + DMNotaEntrada.CdsAlteraPrecoCod_Produto.Text);
    DMOracle.QExecSQL.ExecSQL;
  end;
  if DMNotaEntrada.CDSAlteraPrecoNOVO_VAL_ATACADO.Text <> '' then  // MUDAR VALOR ATACADO(CASA DAS TINTAS) Junior - 19/03/2018.
  begin
    DMOracle.QExecSQL.close;
    DMOracle.QExecSQL.SQL;
    DMOracle.QExecSQL.sql.Clear;
    DMOracle.QExecSQL.sql.Add('UPDATE TB_PRODUTO SET COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente) + ',  VAL_ATACADO = ' +
    Bib.TrocaVirgulaPorPonto(FloatToStr(DMNotaEntrada.CDSAlteraPrecoNOVO_VAL_ATACADO.Value)) +
    ' WHERE COD_PRODUTO = ' + DMNotaEntrada.CdsAlteraPrecoCod_Produto.Text);
    DMOracle.QExecSQL.ExecSQL;
  end;
end;
end.
