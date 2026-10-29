unit UExportaLancamentosContabeis;

interface

uses                                                                         
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, UBiblioteca, Math, ExtCtrls, Mask, DateUtils, StrUtils,
  UFmFilial;

type
  TFExportaLancamentosContabeis = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    BTExportarLancamentosContabeis: TBitBtn;
    FmFilial1: TFmFilial;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    SaveDialog1: TSaveDialog;

    procedure BTExportarLancamentosContabeisClick(Sender: TObject);
  private
    { Private declarations }
    arquivo: TextFile;
  public
    { Public declarations }
  end;

var
  FExportaLancamentosContabeis: TFExportaLancamentosContabeis;

implementation

uses DB, UOracle_cl, UPlanilha_cl;

{$R *.dfm}

procedure TFExportaLancamentosContabeis.BTExportarLancamentosContabeisClick(
  Sender: TObject);
var
  linha, numeroLote, nomeArquivo: String;
  Result: Boolean;
  i: Integer;
  valorTotal: Double;
  linhas: TStringList;
  arquivo: TextFile;

begin
  if Trim(FmFilial1.MeFilial.Text) = '' then
    raise Exception.Create('Informe a Filial.');
  if (MEDtInicial.Text = '') and (MEDtFinal.Text = '') then
    raise Exception.Create('Informe o intervalo de datas.');
  try
    Result := False;
    Panel1.Enabled := false;
    Cursor := crHourGlass;
    linhas := TStringList.Create;
    valorTotal := 0;

    //EXPORTAÇÃO DE PEDIDOS E ITENS DE PEDIDO
    with DMPlanilha do
    begin
      Panel1.Enabled := false;
      Cursor := crHourGlass;

      QExportaLancamentos.Close;
      QExportaLancamentos.SetVariable('COD_FILIAL', Trim(FmFilial1.MeFilial.Text));
      QExportaLancamentos.SetVariable('DT_INICIAL', Trim(MEDtInicial.Text));
      QExportaLancamentos.SetVariable('DT_FINAL', Trim(MEDtFinal.Text));

      QExportaLancamentos.Open;

      linhas.Add('');
      i := 1;
      while not QExportaLancamentos.Eof do
      begin
        linha := 'L' + FormatDateTime('ddMMyyyy',QExportaLancamentosDT_LANCAMENTO.Value) +
          Bib.ift(QExportaLancamentosIND_OPERACAO.Value = 'D',
            bib.StrZero(QExportaLancamentosCOD_REDUZIDO.Text, 6), '000000') +
          Bib.ift(QExportaLancamentosIND_OPERACAO.Value = 'C',
            bib.StrZero(QExportaLancamentosCOD_REDUZIDO.Text, 6), bib.StrZero(QExportaLancamentosCOD_REDUZIDO_CONTRAPARTIDA.Text, 6)) +
          bib.StrZero(QExportaLancamentosCOD_HISTORICO_CONTABIL.Text, 3) +
          Bib.FormataTexto(Copy(QExportaLancamentosDESC_HISTORICO_CONTABIL.Value, 1, 25), 25,' ') +
          bib.StrZero(Bib.LimpaNumero(QExportaLancamentosVAL_LANCAMENTO.Text), 15) +
          '000                            000                                                ' +
          Bib.StrZero(IntToStr(i), 4);
        linhas.Add(linha);
        valorTotal := valorTotal +  Abs(QExportaLancamentosVAL_LANCAMENTO.Value);
        QExportaLancamentos.Next;
        i := i + 1;
        Result := true;
      end;

      Cursor := crDefault;
      if Result then
      begin
        QExportaLancamentos.First;
        if not DirectoryExists(GetCurrentDir + '\LancamentosContabeis\') then
          CreateDir(GetCurrentDir + '\LancamentosContabeis\');
        numeroLote := DMOracle.BuscaNome('select SQLOTE_LANC_CONTABIL.nextval from dual', '');
        nomeArquivo := GetCurrentDir + '\LancamentosContabeis\LOTD' + Bib.StrZero(numeroLote, 5) +
            '_' + Bib.LimpaNumero(QExportaLancamentosNUM_CGC.Value) +'.TXT';

        linhas[0] := 'CM' + FormatDateTime('ddMMyyyy', Date) +
        bib.StrZero(Bib.LimpaNumero(FloatToStr(RoundTo(valorTotal, -2))), 15) +
        'LOTE DOS BANCOS     OUT                                                                                                  ' + Bib.StrZero(numeroLote, 4);

        AssignFile(arquivo, nomeArquivo);
        if FileExists(nomeArquivo) then
          Append(arquivo)
        else
          Rewrite(arquivo);
        for i := 0 to linhas.Count - 1 do
          Writeln(arquivo, UTF8Encode(linhas[i]));
        CloseFile(arquivo);
        ShowMessage('Exportação realizada com sucesso.');
      end
      else
        ShowMessage('Não há notas a serem exportadas.');
      Panel1.Enabled := true;
      Cursor := crDefault;
    end;
  except
    on E: Exception do
      begin
        try
          CloseFile(arquivo);
        except
        end;
        Cursor := crDefault;
        MessageDlg('Erro na exportação.' + #13 + #10 +
          E.Message, mtError, [mbOK], 0);
      end;
  end;
end;


end.
